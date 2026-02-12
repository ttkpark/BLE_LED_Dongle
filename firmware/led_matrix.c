/**
 * 12x12 WS2812B matrix: frame buffer and bit-bang output.
 * matrix_show() sends to matrix then prints to RTT.
 * English only.
 */

#include "nrf.h"
#include "nrf_gpio.h"
#include "nrf_log.h"
#include "led_matrix.h"
#include "nrf_sdh.h"

/* Disable SysTick during WS2812 output so 1ms IRQ doesn't disturb timing */
#define SYSTICK_CTRL         (*(volatile uint32_t *)0xE000E010)
#define SYSTICK_CTRL_ENABLE  (1u << 0)

/* GRB buffer for 144 LEDs */
static uint8_t g_fb[MATRIX_N * 3];

/*
 * WS2812 timing.
 *
 * --- Assembly trial-and-error (시행착오) ---
 * - set/reset were not inlined (BL in disasm) → return + BL added ~10cy, so T0H was always long.
 * - T0H with 2 NOPs (no inline): total ~12cy but 0 not recognized → LED all white.
 * - T0H with 4 NOPs (no inline): ~14cy, over 380ns spec; with 3 NOPs still >380ns.
 * - NOP 많이 줄였을 때 초록 나옴 → shorter timing was correct direction.
 * - Fix: __attribute__((always_inline)) on matrix_pin_set/reset → no BL; High = (STR ~4cy) + NOPs + (STR ~4cy).
 * - T0H = 2 NOPs → ~10cy ~312ns (in spec 220~380ns). T1H = 16 NOPs. T0L = 16 NOPs (T0H+T0L>=40cy). T1L = 2 NOPs (min for T1H+T1L>=40cy).
 * - In disasm: count from STR 0x0508 (OUTSET) to STR 0x050C (OUTCLR) = high; STR 0x050C to next STR 0x0508 = low. 1cy @ 32MHz = 31.25ns.
 */
void delay_cycles(uint32_t n)
{
    while (n--) { __NOP(); __NOP(); }
}

static inline __attribute__((always_inline)) void matrix_pin_set(uint32_t pin)
{
    NRF_P0->OUTSET = (1UL << pin);
}

static inline __attribute__((always_inline)) void matrix_pin_reset(uint32_t pin)
{
    NRF_P0->OUTCLR = (1UL << pin);
}

/* Exact NOP counts for binary-level timing (tune in disasm). 1 NOP = 1 cycle. */
#define _NOP1()   __NOP()
#define _NOP2()   _NOP1(); _NOP1()
#define _NOP3()   _NOP2(); _NOP1()
#define _NOP4()   _NOP2(); _NOP2()
#define _NOP8()   _NOP4(); _NOP4()
#define _NOP16()  _NOP8(); _NOP8()
/*
 * Inlined: High = (STR OUTSET ~4cy) + NOPs + (STR OUTCLR ~4cy). Low = (OUTCLR ~4cy) + NOPs + (byte<<=1, loop, SET ~14cy).
 * T0H+T0L >= 40cy, T1H+T1L >= 40cy; T0L/T1L spec 580ns~1us (19~32cy). Minimize LOW: T0L needs 30cy total so 30-14=16 NOPs; T1L needs 16cy total so 2 NOPs.
 */
/* Final working set (disasm tuning): T0H=2, T1H=16, T0L=16, T1L=2 NOPs + inlined set/reset. */
#define WS2812_EMIT_NOP_T0H()  _NOP2()           /* high '0' */
#define WS2812_EMIT_NOP_T1H()  _NOP8(); _NOP8()  /* high '1' */
#define WS2812_EMIT_NOP_T0L()  _NOP8(); _NOP8()  /* low '0' */
#define WS2812_EMIT_NOP_T1L()  _NOP2()           /* low '1' */


void ws2812_send_byte(uint8_t byte)
{
    uint32_t pin = MATRIX_DATA_PIN;
    for (int8_t b = 7; b >= 0; b--)
    {
        matrix_pin_set(pin);
        if (byte & 0x80)
        {
            WS2812_EMIT_NOP_T1H();
            matrix_pin_reset(pin);
            WS2812_EMIT_NOP_T1L();
        }
        else
        {
            WS2812_EMIT_NOP_T0H();
            matrix_pin_reset(pin);
            WS2812_EMIT_NOP_T0L();
        }
        byte <<= 1;
    }
}

/* RTE: end of transmission = low pulse >280us. Hold data line low. */
void ws2812_send_reset(void)
{
    uint32_t pin = MATRIX_DATA_PIN;
    matrix_pin_reset(pin);
    for (volatile uint32_t i = 0; i < WS2812_RES_NOP; i++) { __NOP(); }
    /* Leave pin low until next frame. */
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
    // WS2812 requires precise timing (~800ns per bit, ~24us per LED)
    // For 144 LEDs: ~3.5ms total transmission time
    // Strategy: Give SoftDevice priority - only update when SoftDevice is completely idle
    // This minimizes SoftDevice API calls and gives SoftDevice full control
    
    // Check if SoftDevice is enabled and not suspended before proceeding
    // If SoftDevice is busy, we skip this update (caller should retry later)
    // This gives SoftDevice priority - if it's busy, LED update is skipped
    if (!nrf_sdh_is_enabled() || nrf_sdh_is_suspended())
    {
        // SoftDevice is not ready - skip this update
        // This gives SoftDevice priority over LED updates
        return;
    }
    
    // Disable ALL interrupts globally (including SoftDevice IRQ)
    // This is necessary for WS2812 timing accuracy
    // We only do this when SoftDevice is idle, minimizing interference
    // No nrf_sdh_suspend() call - we rely on caller to ensure SoftDevice is idle
    __disable_irq();
    
    // Also disable SysTick to prevent 1ms IRQ from disturbing timing
    uint32_t ctrl = SYSTICK_CTRL;
    SYSTICK_CTRL = ctrl & ~SYSTICK_CTRL_ENABLE;
    
    // Send all LED data (critical timing section - MUST be interrupt-free)
    // This takes ~3.5ms for 144 LEDs - short enough for BLE to handle
    for (uint16_t i = 0; i < sizeof(g_fb); i++)
        ws2812_send_byte(g_fb[i]);
    ws2812_send_reset();
    
    // Restore SysTick
    SYSTICK_CTRL = ctrl;
    
    // Re-enable interrupts immediately after transmission
    __enable_irq();
    
    NRF_LOG_INFO("matrix frame sent");
}

void matrix_delay_1sec(void)
{
    delay_cycles(DELAY_1SEC_CYCLES);
}

void matrix_update_once(uint8_t dim)
{
    matrix_fill(dim, dim, dim);
    matrix_show();
}
