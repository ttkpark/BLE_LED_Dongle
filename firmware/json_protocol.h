/**
 * JSON protocol handler for BLE LED Dongle
 * Handles commands from Flutter app
 */

#ifndef JSON_PROTOCOL_H
#define JSON_PROTOCOL_H

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

// Image data size
#define PIXEL_DATA_SIZE (12 * 12 * 3)  // 432 bytes per frame

// Current display mode
typedef enum {
    DISPLAY_MODE_IDLE,
    DISPLAY_MODE_IMAGE
} display_mode_t;

// Protocol handler
void json_protocol_init(void);
void json_protocol_process(const uint8_t *data, uint16_t length);
bool json_protocol_is_active(void);  // Check if JSON protocol is currently receiving data
void json_protocol_reset(void);  // Reset JSON protocol state
void json_protocol_send_response(const char *cmd, int id, const char *status, const char *message);
void json_protocol_send_error(int id, const char *code, const char *message);

// Brightness control
void set_global_brightness(uint8_t brightness);
uint8_t get_global_brightness(void);

// Status
display_mode_t get_display_mode(void);

#ifdef __cplusplus
}
#endif

#endif // JSON_PROTOCOL_H
