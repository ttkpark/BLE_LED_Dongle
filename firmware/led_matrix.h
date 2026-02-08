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

/* GPIO pin for matrix data (DIN). If all LEDs stay white, try 4, 5, 7, 8 to match schematic. */
#ifndef MATRIX_DATA_PIN
#define MATRIX_DATA_PIN  6
#endif

/* 1 = board inverts data (e.g. N-MOS). Pin to VCC/GND=off, release=white -> try 0. */
#ifndef WS2812_INVERT_DATA
#define WS2812_INVERT_DATA  0
#endif

/* RGB 0..255. Stored as GRB for WS2812. */
void matrix_set_pixel(uint8_t row, uint8_t col, uint8_t r, uint8_t g, uint8_t b);
void matrix_clear(void);
void matrix_draw_x(uint8_t r, uint8_t g, uint8_t b);
void matrix_show(void);
void matrix_draw_first_led_only(uint8_t r, uint8_t g, uint8_t b);
void matrix_fill(uint8_t r, uint8_t g, uint8_t b);

#endif
