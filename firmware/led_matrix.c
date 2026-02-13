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
 * 144 LEDs × 3 bytes × 8 bits = 3,456 PWM values
 * Plus reset pulse: ~400 PWM values of zeros (500us at 1.25us per value)
 */
#define WS2812_PWM_BUFFER_SIZE  (MATRIX_N * 3 * 8 + 400)
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
 * WS2812 timing @ 16MHz (62.5ns per cycle, top=20 = 1.25us per bit):
 * - Bit '0': HIGH 0.3us (5 cycles), LOW 0.95us (15 cycles) → PWM value: 5 (out of 20)
 * - Bit '1': HIGH 0.6us (10 cycles), LOW 0.65us (10 cycles) → PWM value: 10 (out of 20)
 * 
 * Note: PWM is inverted, so HIGH = low PWM value, LOW = high PWM value
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
            // Bit '1': HIGH 0.6us = 10 cycles out of 20 (625ns)
            *(pwm_buffer++) = 10;
        }
        else
        {
            // Bit '0': HIGH 0.3us = 5 cycles out of 20 (312.5ns)
            *(pwm_buffer++) = 5;
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
    pwm_config.output_pins[0] = MATRIX_DATA_PIN;
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
    
    // Immediately send all zeros to turn off all LEDs
    // This prevents PWM from sending default values that might turn on LEDs
    matrix_clear();
    matrix_show();
    
    // Wait for transfer to complete
    uint32_t timeout = 1000000;
    while (!m_pwm_transfer_complete && timeout--)
    {
        __NOP();
    }
    
    // Stop PWM and uninitialize to prevent any further signals
   // nrfx_pwm_stop(&m_pwm, true);  // Stop PWM and wait until stopped
    //nrfx_pwm_uninit(&m_pwm);      // Uninitialize PWM
    
    // Set pin to GPIO LOW to ensure no signal
    //nrf_gpio_cfg_output(MATRIX_DATA_PIN);
    //nrf_gpio_pin_clear(MATRIX_DATA_PIN);
    
    //NRF_LOG_INFO("All LEDs set to OFF, PWM stopped and pin set to GPIO LOW");
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

/**
 * @brief Test function: Send only first LED with detailed logging
 * This helps debug WS2812 encoding issues
 */
void matrix_test_single_led(uint8_t r, uint8_t g, uint8_t b)
{
    matrix_clear();
    g_fb[0] = g;  // GRB format: Green first
    g_fb[1] = r;  // Red second
    g_fb[2] = b;  // Blue third
    
    NRF_LOG_INFO("Test LED: R=%d, G=%d, B=%d", r, g, b);
    NRF_LOG_INFO("Frame buffer: [0]=0x%02X(G), [1]=0x%02X(R), [2]=0x%02X(B)", 
                 g_fb[0], g_fb[1], g_fb[2]);
    
    // Encode first byte (Green) and log PWM values
    uint16_t pwm_idx = 0;
    encode_ws2812_byte(g_fb[0], &g_pwm_buffer[pwm_idx]);
    
    NRF_LOG_INFO("Green byte 0x%02X -> PWM values:", g_fb[0]);
    for (int i = 0; i < 8; i++)
    {
        NRF_LOG_INFO("  Bit %d: PWM=%d", 7-i, g_pwm_buffer[pwm_idx + i]);
    }
    
    pwm_idx += 8;
    encode_ws2812_byte(g_fb[1], &g_pwm_buffer[pwm_idx]);  // Red
    pwm_idx += 8;
    encode_ws2812_byte(g_fb[2], &g_pwm_buffer[pwm_idx]);  // Blue
    pwm_idx += 8;
    
    // Add reset pulse: ~400 PWM values of zeros (500us at 1.25us per value)
    for (uint16_t i = 0; i < 400; i++)
    {
        g_pwm_buffer[pwm_idx++] = 0;
    }
    
    NRF_LOG_INFO("Total PWM values: %d (3 bytes * 8 bits + 400 reset)", pwm_idx);
    
    // Reset transfer complete flag
    m_pwm_transfer_complete = false;
    
    // Configure PWM sequence
    nrf_pwm_sequence_t pwm_sequence;
    pwm_sequence.values.p_common = g_pwm_buffer;
    pwm_sequence.length = pwm_idx;
    pwm_sequence.repeats = 0;
    pwm_sequence.end_delay = 0;
    
    // Start PWM transfer
    (void)nrfx_pwm_simple_playback(&m_pwm, &pwm_sequence, 1, NRFX_PWM_FLAG_STOP);
    
    // Wait for transfer to complete
    uint32_t timeout = 1000000;
    while (!m_pwm_transfer_complete && timeout--)
    {
        __NOP();
    }
    
    if (m_pwm_transfer_complete)
    {
        NRF_LOG_INFO("Test LED sent via PWM");
    }
    else
    {
        NRF_LOG_ERROR("PWM transfer timeout");
    }
    
    NRF_LOG_FLUSH();
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
    g_pwm_buffer[pwm_idx++] = 20;
    for (uint16_t i = 0; i < sizeof(g_fb); i++)
    {
        encode_ws2812_byte(g_fb[i], &g_pwm_buffer[pwm_idx]);
        pwm_idx += 8;  // 8 WS2812 bits = 8 PWM values
    }
    
    // Add reset pulse: ~400 PWM values of zeros (500us at 1.25us per value)
    // WS2812 requires >50us reset, we use 500us for safety
    for (uint16_t i = 0; i < 400; i++)
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
    // nrfx_pwm_simple_playback returns task ID (uint32_t), not error code
    (void)nrfx_pwm_simple_playback(&m_pwm, &pwm_sequence, 1, NRFX_PWM_FLAG_STOP);
    
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
