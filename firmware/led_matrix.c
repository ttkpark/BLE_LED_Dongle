/**
 * 12x12 WS2812B matrix: PWM EasyDMA output.
 * Uses PWM EasyDMA to automatically send WS2812 protocol without CPU intervention.
 * This eliminates the need for interrupt disabling and works seamlessly with SoftDevice.
 * 
 * PWM configuration:
 * - Base clock: 16MHz
 * - Top value: 20 (800ns per PWM period = WS2812 bit period)
 * - Bit '0': HIGH 312ns = 6 PWM cycles, LOW 936ns = 14 PWM cycles
 * - Bit '1': HIGH 625ns = 12 PWM cycles, LOW 625ns = 8 PWM cycles
 */

#include "sdk_config.h"
#include "nrf.h"
#include "nrf_gpio.h"
#include "app_util_platform.h"
#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "led_matrix.h"
#include "nrfx_pwm.h"

/* GRB buffer for 144 LEDs */
static uint8_t g_fb[MATRIX_N * 3];

/* PWM instance for WS2812 control */
static nrfx_pwm_t m_pwm;

/* PWM buffer: Each WS2812 bit = 1 PWM sequence value
 * 1 leading + 144 LEDs × 3 bytes × 8 bits = 3,456 + 400 reset
 */
#define WS2812_PWM_PREP_LEN     10
#define WS2812_PWM_RESET_LEN    200
#define WS2812_PWM_DATA_LEN    (MATRIX_N * 3 * 8)
#define WS2812_PWM_BUFFER_SIZE  (WS2812_PWM_PREP_LEN + WS2812_PWM_DATA_LEN + WS2812_PWM_RESET_LEN)
#define WS2812_PWM_SEQ_LEN      WS2812_PWM_BUFFER_SIZE

static nrf_pwm_values_common_t g_pwm_buffer[WS2812_PWM_BUFFER_SIZE];

/* When true, handler restarts sequence (continuous DMA). When false, one-shot (e.g. test). */
static volatile bool m_dma_loop_running = false;
static volatile bool m_pwm_transfer_complete = false;

static void pwm_restart_sequence(void);

/**
 * @brief PWM event handler - when sequence ends: restart if loop mode, else set complete flag
 */
static void pwm_event_handler(nrfx_pwm_evt_type_t event_type)
{
    if (event_type != NRFX_PWM_EVT_FINISHED) return;
    if (m_dma_loop_running)
        pwm_restart_sequence();
    else
        m_pwm_transfer_complete = true;
}

/**
 * @brief Encode WS2812 byte to PWM values
 * WS2812 timing @ 16MHz (62.5ns per cycle, top=20 = 1.25us per bit):
 * - Bit '0': HIGH 0.3us (5 cycles), LOW 0.95us (15 cycles) → PWM value: 5 (out of 20)
 * - Bit '1': HIGH 0.6us (10 cycles), LOW 0.65us (10 cycles) → PWM value: 10 (out of 20)
 * 
 * Note: PWM is inverted, so HIGH = low PWM value, LOW = high PWM value
 * 
 * @param byte WS2812 data byte (GRB format)
 * @param pwm_buffer Output buffer for PWM values (8 values for 8 bits)
 */

 
// 1 : normal
// 0 : short HIGH
static void encode_ws2812_byte(uint8_t byte, nrf_pwm_values_common_t *pwm_buffer)
{
    for (int8_t bit = 7; bit >= 0; bit--)
    {
        if (byte & (1 << bit))
        {
            // Bit '1': HIGH 0.6us = 10 cycles out of 20 (625ns)
            *(pwm_buffer++) = 10;
        }
        else
        {
            // Bit '0': HIGH 0.3us = 5 cycles out of 20 (312.5ns)
            *(pwm_buffer++) = 15;
        }
    }
}

/**
 * @brief Initialize PWM for WS2812 control
 * Must be called before matrix_show().
 */
void matrix_spi_init(void)
{
    // Initialize PWM instance structure directly
    // NRFX_PWM_INSTANCE macro cannot be used in assignment
    // PWM0 instance index is 0
    m_pwm.p_registers = NRF_PWM0;
    m_pwm.drv_inst_idx = 0;
    
    nrfx_pwm_config_t pwm_config = NRFX_PWM_DEFAULT_CONFIG;
    pwm_config.output_pins[0] = MATRIX_DATA_PIN | WS2812_INVERT_DATA;
    pwm_config.output_pins[1] = NRFX_PWM_PIN_NOT_USED;
    pwm_config.output_pins[2] = NRFX_PWM_PIN_NOT_USED;
    pwm_config.output_pins[3] = NRFX_PWM_PIN_NOT_USED;
    pwm_config.base_clock = NRF_PWM_CLK_16MHz;  // 16MHz base clock
    pwm_config.count_mode = NRF_PWM_MODE_UP;     // Up counting mode
    pwm_config.top_value = 20;                    // 1.25us per PWM period (20 cycles @ 16MHz = 1250ns)
    pwm_config.load_mode = NRF_PWM_LOAD_COMMON;   // Common load mode
    pwm_config.step_mode = NRF_PWM_STEP_AUTO;     // Auto step mode
    pwm_config.irq_priority = APP_IRQ_PRIORITY_LOWEST;  // Low priority to not interfere with SoftDevice
    
    nrfx_err_t err_code = nrfx_pwm_init(&m_pwm, &pwm_config, pwm_event_handler);
    APP_ERROR_CHECK(err_code);
    
    NRF_LOG_INFO("PWM initialized for WS2812 on pin %d", MATRIX_DATA_PIN);
    
    // Prepare buffer (all off) and start DMA loop (runs forever; handler restarts sequence)
    m_dma_loop_running = true;
    matrix_clear();
    matrix_show();
    pwm_restart_sequence();
}

void matrix_set_pixel(uint8_t row, uint8_t col, uint8_t r, uint8_t g, uint8_t b)
{
    if (row >= MATRIX_H || col >= MATRIX_W) return;
    uint16_t i = (uint16_t)row * MATRIX_W + col;
    uint16_t o = i * 3;
    g_fb[o + 0] = g;
    g_fb[o + 1] = r;
    g_fb[o + 2] = b;
}

void matrix_clear(void)
{
    for (uint16_t i = 0; i < sizeof(g_fb); i++)
        g_fb[i] = 0;
}

void matrix_draw_x(uint8_t r, uint8_t g, uint8_t b)
{
    matrix_clear();
    for (uint8_t i = 0; i < MATRIX_W; i++)
    {
        matrix_set_pixel(i, i, r, g, b);
        matrix_set_pixel(i, (MATRIX_W - 1) - i, r, g, b);
    }
}

void matrix_draw_first_led_only(uint8_t r, uint8_t g, uint8_t b)
{
    matrix_clear();
    g_fb[0] = g;
    g_fb[1] = r;
    g_fb[2] = b;
}

void matrix_fill(uint8_t r, uint8_t g, uint8_t b)
{
    for (uint16_t i = 0; i < MATRIX_N; i++)
        matrix_set_pixel((uint8_t)(i / MATRIX_W), (uint8_t)(i % MATRIX_W), r, g, b);
}

/**
 * @brief Restart PWM sequence (called from event handler for continuous DMA)
 */
void pwm_restart_sequence(void)
{
    nrf_pwm_sequence_t seq;
    seq.values.p_common = g_pwm_buffer;
    seq.length = WS2812_PWM_SEQ_LEN;
    seq.repeats = 0;
    seq.end_delay = 0;
    (void)nrfx_pwm_simple_playback(&m_pwm, &seq, 1, 0);
}

/**
 * @brief Prepare DMA buffer from g_fb (memory only). Call periodically; running DMA uses new data next loop.
 */
void matrix_show(void)
{
    uint16_t idx = 0;
    for (uint16_t i = 0; i < WS2812_PWM_PREP_LEN; i++)
        g_pwm_buffer[idx++] = 21;
    for (uint16_t i = 0; i < sizeof(g_fb); i++)
    {
        encode_ws2812_byte(g_fb[i], &g_pwm_buffer[idx]);
        idx += 8;
    }
    for (uint16_t i = 0; i < WS2812_PWM_RESET_LEN; i++)
        g_pwm_buffer[idx++] = 21;
}

/**
 * @brief Fill matrix with rainbow and push to DMA buffer (memory only). Call periodically for animation.
 * @param phase 0..255, increment each frame.
 */
void matrix_rainbow(uint8_t phase)
{
    for (uint16_t i = 0; i < MATRIX_N; i++)
    {
        uint8_t r, g, b;
        r = g = b = (phase/10)%5;
        matrix_set_pixel((uint8_t)(i / MATRIX_W), (uint8_t)(i % MATRIX_W), r, g, b);
    }
    matrix_show();
}
