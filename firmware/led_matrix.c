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
#include "nrf_log.h"
#include "led_matrix.h"
#include "nrfx_pwm.h"
#include "app_util_platform.h"

/* GRB buffer for 144 LEDs */
static uint8_t g_fb[MATRIX_N * 3];

/* PWM instance for WS2812 control */
static nrfx_pwm_t m_pwm;

/* PWM buffer: Each WS2812 bit = 1 PWM sequence value
 * 144 LEDs × 3 bytes × 8 bits = 3,456 PWM values
 * Plus reset pulse: ~350 PWM values of zeros (280us at 800ns per value)
 */
#define WS2812_PWM_BUFFER_SIZE  (MATRIX_N * 3 * 8 + 350)
static nrf_pwm_values_common_t g_pwm_buffer[WS2812_PWM_BUFFER_SIZE];

/* Flag to track PWM transfer completion */
static volatile bool m_pwm_transfer_complete = false;

/**
 * @brief PWM event handler - called when transfer completes
 */
static void pwm_event_handler(nrfx_pwm_evt_type_t event_type)
{
    if (event_type == NRFX_PWM_EVT_FINISHED)
    {
        m_pwm_transfer_complete = true;
    }
}

/**
 * @brief Encode WS2812 byte to PWM values
 * Each WS2812 bit is encoded as PWM duty cycle:
 * - Bit '0': HIGH 312ns (6 cycles), LOW 936ns (14 cycles) → PWM value: 6 (out of 20)
 * - Bit '1': HIGH 625ns (12 cycles), LOW 625ns (8 cycles) → PWM value: 12 (out of 20)
 * 
 * @param byte WS2812 data byte (GRB format)
 * @param pwm_buffer Output buffer for PWM values (8 values for 8 bits)
 */
static void encode_ws2812_byte(uint8_t byte, nrf_pwm_values_common_t *pwm_buffer)
{
    for (int8_t bit = 7; bit >= 0; bit--)
    {
        if (byte & (1 << bit))
        {
            // Bit '1': HIGH 625ns = 12 cycles out of 20
            *pwm_buffer++ = 12;
        }
        else
        {
            // Bit '0': HIGH 312ns = 6 cycles out of 20
            *pwm_buffer++ = 6;
        }
    }
}

/**
 * @brief Initialize PWM for WS2812 control
 * Must be called before matrix_show().
 */
void matrix_spi_init(void)
{
    nrfx_pwm_config_t pwm_config = NRFX_PWM_DEFAULT_CONFIG;
    pwm_config.output_pins[0] = MATRIX_DATA_PIN | NRFX_PWM_PIN_INVERTED;  // Inverted for WS2812
    pwm_config.output_pins[1] = NRFX_PWM_PIN_NOT_USED;
    pwm_config.output_pins[2] = NRFX_PWM_PIN_NOT_USED;
    pwm_config.output_pins[3] = NRFX_PWM_PIN_NOT_USED;
    pwm_config.base_clock = NRF_PWM_CLK_16MHz;  // 16MHz base clock
    pwm_config.count_mode = NRF_PWM_MODE_UP;     // Up counting mode
    pwm_config.top_value = 20;                    // 800ns per PWM period (20 cycles @ 16MHz)
    pwm_config.load_mode = NRF_PWM_LOAD_COMMON;   // Common load mode
    pwm_config.step_mode = NRF_PWM_STEP_AUTO;     // Auto step mode
    pwm_config.irq_priority = APP_IRQ_PRIORITY_LOWEST;  // Low priority to not interfere with SoftDevice
    
    ret_code_t err_code = nrfx_pwm_init(&m_pwm, &pwm_config, pwm_event_handler);
    APP_ERROR_CHECK(err_code);
    
    NRF_LOG_INFO("PWM initialized for WS2812 on pin %d", MATRIX_DATA_PIN);
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
 * @brief Send LED matrix data via PWM EasyDMA
 * This function uses PWM EasyDMA to automatically send WS2812 protocol.
 * No interrupt disabling needed - works seamlessly with SoftDevice.
 */
void matrix_show(void)
{
    uint16_t pwm_idx = 0;
    
    // Encode all LED data to PWM values
    // Each WS2812 byte (8 bits) becomes 8 PWM values (one per WS2812 bit)
    for (uint16_t i = 0; i < sizeof(g_fb); i++)
    {
        encode_ws2812_byte(g_fb[i], &g_pwm_buffer[pwm_idx]);
        pwm_idx += 8;  // 8 WS2812 bits = 8 PWM values
    }
    
    // Add reset pulse: ~350 PWM values of zeros (280us at 800ns per value)
    for (uint16_t i = 0; i < 350; i++)
    {
        g_pwm_buffer[pwm_idx++] = 0;
    }
    
    // Reset transfer complete flag
    m_pwm_transfer_complete = false;
    
    // Configure PWM sequence
    nrf_pwm_sequence_t pwm_sequence;
    pwm_sequence.values.p_common = g_pwm_buffer;
    pwm_sequence.length = pwm_idx;
    pwm_sequence.repeats = 0;
    pwm_sequence.end_delay = 0;
    
    // Start PWM transfer using EasyDMA
    // This will automatically send data without CPU intervention
    ret_code_t err_code = nrfx_pwm_simple_playback(&m_pwm, &pwm_sequence, 1, NRFX_PWM_FLAG_STOP);
    if (err_code != NRF_SUCCESS)
    {
        NRF_LOG_ERROR("PWM transfer failed: 0x%08X", err_code);
        return;
    }
    
    // Wait for transfer to complete (non-blocking, but we wait here for now)
    // In the future, this could be made fully asynchronous
    uint32_t timeout = 1000000;  // 1 second timeout
    while (!m_pwm_transfer_complete && timeout--)
    {
        __NOP();
    }
    
    if (m_pwm_transfer_complete)
    {
        NRF_LOG_INFO("matrix frame sent via PWM EasyDMA");
    }
    else
    {
        NRF_LOG_ERROR("PWM transfer timeout");
    }
}

void matrix_delay_1sec(void)
{
    // Simple delay - can be improved with app_timer if needed
    for (volatile uint32_t i = 0; i < 1000000; i++)
    {
        __NOP();
    }
}

void matrix_update_once(uint8_t dim)
{
    matrix_fill(dim, dim, dim);
    matrix_show();
}
