/**
 * 12x12 WS2812B matrix: frame buffer and bit-bang output.
 * matrix_show() sends to matrix then prints to RTT.
 * English only.
 */

#include "nrf.h"
#include "nrf_gpio.h"
#include "nrf_log.h"
#include "led_matrix.h"

/* GRB buffer for 144 LEDs */
static uint8_t g_fb[MATRIX_N * 3];

/*
 * Panel timing (non-inverted): at 64MHz, 1 cycle = 15.625ns.
 * T0H 220~380ns, T1H 580ns~1us, T0L/T1L 580ns~1us, RES >280us.
 */
static inline void delay_cycles(uint32_t n)
{
    while (n--) { __NOP(); __NOP(); }
}

static void ws2812_send_byte(uint8_t byte)
{
    uint32_t pin = MATRIX_DATA_PIN;
    for (int8_t b = 7; b >= 0; b--)
    {
        uint32_t bit1 = (byte & (1u << b)) ? 1 : 0;
#if WS2812_INVERT_DATA
        bit1 = 1u - bit1;
#endif
        if (bit1)
        {
            NRF_P0->OUTSET = (1UL << pin);
            delay_cycles(26);   /* T1H 580ns~1us: ~0.8us */
            NRF_P0->OUTCLR = (1UL << pin);
            delay_cycles(26);   /* T1L 580ns~1us */
        }
        else
        {
            NRF_P0->OUTSET = (1UL << pin);
            delay_cycles(10);   /* T0H 220~380ns: ~300ns */
            NRF_P0->OUTCLR = (1UL << pin);
            delay_cycles(26);   /* T0L 580ns~1us */
        }
    }
}

/* RES frame unit: low voltage time >280us. 280us*64 = 17920 cycles. */
static void ws2812_send_reset(void)
{
    uint32_t pin = MATRIX_DATA_PIN;
#if WS2812_INVERT_DATA
    NRF_P0->OUTSET = (1UL << pin);
#else
    NRF_P0->OUTCLR = (1UL << pin);
#endif
    for (volatile uint32_t i = 0; i < 18000u; i++) { __NOP(); }  /* >280us */
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

/* Fill entire panel with one RGB (0..255). */
void matrix_fill(uint8_t r, uint8_t g, uint8_t b)
{
    for (uint16_t i = 0; i < MATRIX_N; i++)
        matrix_set_pixel((uint8_t)(i / MATRIX_W), (uint8_t)(i % MATRIX_W), r, g, b);
}

void matrix_show(void)
{
    uint32_t basepri;
    nrf_gpio_cfg_output(MATRIX_DATA_PIN);
    ws2812_send_reset();
    /* Disable interrupts during WS2812 bit-bang so timing is not disturbed */
    basepri = __get_BASEPRI();
    __set_BASEPRI(1 << 6);   /* mask all configurable exceptions */
    for (uint16_t i = 0; i < sizeof(g_fb); i++)
        ws2812_send_byte(g_fb[i]);
    __set_BASEPRI(basepri);
    ws2812_send_reset();

    NRF_LOG_INFO("matrix frame sent (12x12 X)");
}
