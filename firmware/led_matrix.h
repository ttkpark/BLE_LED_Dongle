/**
 * 12x12 WS2812B matrix display (144 LEDs).
 * Row-major: (row,col) -> index = row*12 + col.
 * All strings and comments in English for debugger/build compatibility.
 */

#ifndef LED_MATRIX_H
#define LED_MATRIX_H

#include <stdint.h>

#define MATRIX_W       12
#define MATRIX_H       12
#define MATRIX_N       (MATRIX_W * MATRIX_H)

/* GPIO pin for matrix data (DIN). Pin 6 is used for LED matrix. BSP LEDs moved to 21-24 via custom_board.h */
#ifndef MATRIX_DATA_PIN
#define MATRIX_DATA_PIN  6
#endif

/* 1 = board inverts data (e.g. N-MOS). Pin to VCC/GND=off, release=white -> try 0. */
#ifndef WS2812_INVERT_DATA
#define WS2812_INVERT_DATA  0
#endif

/* CPU clock (MHz) for timing. 32 = external 32MHz crystal (HFCLK from XTAL). nRF52 has no PLL; 64MHz = internal RC (see CLOCK_64MHz.md). */
#ifndef WS2812_CPU_MHZ
#define WS2812_CPU_MHZ  32
#endif

/* Timing scale for LED: 100/DEN. DEN=130. */
#ifndef WS2812_TICK_SCALE_NUM
#define WS2812_TICK_SCALE_NUM  100
#endif
#ifndef WS2812_TICK_SCALE_DEN
#define WS2812_TICK_SCALE_DEN  130
#endif

/* 1s delay only: 100/DEN. DEN=299 so 1s is ~1s (was 130→2.3s). */
#ifndef DELAY_1SEC_SCALE_NUM
#define DELAY_1SEC_SCALE_NUM   100
#endif
#ifndef DELAY_1SEC_SCALE_DEN
#define DELAY_1SEC_SCALE_DEN   299
#endif

#define _DELAY_1SEC_SCALE(x) (((x) * DELAY_1SEC_SCALE_NUM) / DELAY_1SEC_SCALE_DEN)

#if (WS2812_CPU_MHZ == 32)
/* 32MHz: 1 cy = 62.5ns. T0H=5(~312ns), T1H/T1L=13(~812ns), T0L=16(~1us) so T0H+T0L>=1.25us. RES 9000 NOPs >280us. */
#define WS2812_T0H_CY     _DELAY_1SEC_SCALE(5)
#define WS2812_T1H_CY     _DELAY_1SEC_SCALE(13)
#define WS2812_T0L_CY     _DELAY_1SEC_SCALE(16)
#define WS2812_T1L_CY     _DELAY_1SEC_SCALE(13)
#define WS2812_RES_NOP    ((uint32_t)_DELAY_1SEC_SCALE(9000))
#define DELAY_1SEC_CYCLES _DELAY_1SEC_SCALE(16000000u)
#else
/* 64MHz: 1 cy = 31.25ns. T0H=10(~312ns), T1H/T1L=26(~812ns), T0L=30(~937ns) so T0H+T0L>=1.25us. RES 18000 NOPs >280us. */
#define WS2812_T0H_CY     _DELAY_1SEC_SCALE(10)
#define WS2812_T1H_CY     _DELAY_1SEC_SCALE(26)
#define WS2812_T0L_CY     _DELAY_1SEC_SCALE(30)
#define WS2812_T1L_CY     _DELAY_1SEC_SCALE(26)
#define WS2812_RES_NOP    ((uint32_t)_DELAY_1SEC_SCALE(18000))
#define DELAY_1SEC_CYCLES _DELAY_1SEC_SCALE(32000000u)
#endif

/* RGB 0..255. Stored as GRB for WS2812. */
void matrix_set_pixel(uint8_t row, uint8_t col, uint8_t r, uint8_t g, uint8_t b);
void matrix_clear(void);
void matrix_draw_x(uint8_t r, uint8_t g, uint8_t b);
void matrix_show(void);
void matrix_draw_first_led_only(uint8_t r, uint8_t g, uint8_t b);
void matrix_fill(uint8_t r, uint8_t g, uint8_t b);

/** Delay ~1s; uses same timing scale as WS2812. */
void matrix_delay_1sec(void);

/** One periodic update: fill panel with (dim,dim,dim) and show (all LED output here). */
void matrix_update_once(uint8_t dim);
void ws2812_send_reset(void);
void ws2812_send_byte(uint8_t byte);
void delay_cycles(uint32_t n);
#endif
