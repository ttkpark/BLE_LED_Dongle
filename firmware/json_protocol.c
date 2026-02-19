/**
 * JSON protocol handler implementation
 * Processes commands from Flutter app and controls LED matrix
 * Image mode only (animation removed for memory constraints)
 */

#include "json_protocol.h"
#include "json_parser.h"
#include "base64.h"
#include "led_matrix.h"
#include "ble_nus.h"
#include "ble_hci.h"
#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
#include <string.h>
#include <stdio.h>

// External BLE NUS send function and variables
extern uint16_t m_conn_handle;

// Forward declaration of BLE NUS data send function
uint32_t ble_nus_data_send(ble_nus_t *p_nus, uint8_t *p_data, uint16_t *p_length, uint16_t conn_handle);

// Forward declaration from main.c - get m_nus pointer
ble_nus_t* get_ble_nus_instance(void);

// Global state
static display_mode_t g_display_mode = DISPLAY_MODE_IDLE;
static uint8_t g_brightness = 255;

// Static image buffer
static uint8_t g_static_image[PIXEL_DATA_SIZE] = {0};

// Response buffer (reduced size)
static char g_response_buffer[128];

// Static buffers to avoid stack overflow
// Increased JSON buffer to handle multi-packet messages
static char g_json_str_buffer[800];  // Increased to handle multiple BLE packets (up to 4 packets of 200 bytes)
static char g_status_json_buffer[96];  // Reduced from 128
static uint16_t g_json_buffer_pos = 0;  // Current position in buffer
static bool g_json_receiving = false;  // Flag to track if we're receiving JSON data

// Forward declarations
static void handle_set_image(const char *json, uint16_t json_len, int id);
static void handle_set_brightness(const char *json, uint16_t json_len);
static void handle_get_status(int id);
static void handle_reset(void);
static void apply_pixel_data_to_matrix(const uint8_t *pixel_data, uint8_t brightness);

void json_protocol_init(void) {
    g_display_mode = DISPLAY_MODE_IDLE;
    g_brightness = 255;
    memset(g_static_image, 0, sizeof(g_static_image));
    g_json_buffer_pos = 0;
    g_json_str_buffer[0] = '\0';
    g_json_receiving = false;
}

bool json_protocol_is_active(void) {
    return g_json_receiving;
}

void json_protocol_reset(void) {
    g_json_buffer_pos = 0;
    g_json_str_buffer[0] = '\0';
    g_json_receiving = false;
}

void json_protocol_send_response(const char *cmd, int id, const char *status, const char *message) {
    if (m_conn_handle == BLE_CONN_HANDLE_INVALID) return; // Not connected
    
    int len = json_create_response(g_response_buffer, sizeof(g_response_buffer), 
                                    cmd, id, status, message);
    if (len > 0 && len < sizeof(g_response_buffer)) {
        uint16_t length = (uint16_t)len;
        ble_nus_t *p_nus = get_ble_nus_instance();
        (void)ble_nus_data_send(p_nus, (uint8_t*)g_response_buffer, &length, m_conn_handle);
        NRF_LOG_INFO("Sent response: %s", g_response_buffer);
        NRF_LOG_FLUSH();
    }
}

void json_protocol_send_error(int id, const char *code, const char *message) {
    if (m_conn_handle == BLE_CONN_HANDLE_INVALID) return;
    
    int len = json_create_error(g_response_buffer, sizeof(g_response_buffer), id, code, message);
    if (len > 0 && len < sizeof(g_response_buffer)) {
        uint16_t length = (uint16_t)len;
        ble_nus_t *p_nus = get_ble_nus_instance();
        (void)ble_nus_data_send(p_nus, (uint8_t*)g_response_buffer, &length, m_conn_handle);
        NRF_LOG_INFO("Sent error: %s", g_response_buffer);
        NRF_LOG_FLUSH();
    }
}

void json_protocol_process(const uint8_t *data, uint16_t length) {
    if (data == NULL || length == 0) return;
    
    // Check if this is a new JSON message (starts with '{')
    if (g_json_buffer_pos == 0 && data[0] == '{') {
        g_json_receiving = true;  // Start receiving JSON
    }
    
    // If we're not receiving JSON and this doesn't start with '{', ignore
    if (!g_json_receiving && data[0] != '{') {
        return;
    }
    
    // Append data to buffer
    uint16_t remaining = sizeof(g_json_str_buffer) - g_json_buffer_pos - 1;
    if (length > remaining) {
        length = remaining;
    }
    
    memcpy(g_json_str_buffer + g_json_buffer_pos, data, length);
    g_json_buffer_pos += length;
    g_json_str_buffer[g_json_buffer_pos] = '\0';
    
    // Check if JSON is complete (ends with '}' and possibly whitespace)
    uint16_t json_len = g_json_buffer_pos;
    while (json_len > 0 && (g_json_str_buffer[json_len - 1] == '\r' || 
                            g_json_str_buffer[json_len - 1] == '\n' || 
                            g_json_str_buffer[json_len - 1] == ' ' || 
                            g_json_str_buffer[json_len - 1] == '\t')) {
        json_len--;
    }
    
    // If JSON is not complete, wait for more data
    if (json_len == 0 || g_json_str_buffer[json_len - 1] != '}') {
        // JSON not complete yet, wait for next packet
        return;
    }
    
    // JSON is complete, process it
    g_json_str_buffer[json_len] = '\0';
    g_json_receiving = false;  // Stop receiving
    
    NRF_LOG_INFO("JSON RX (complete, len=%d): %s", json_len, g_json_str_buffer);
    NRF_LOG_FLUSH();
    
    // Get command (need to extract string properly)
    const char *cmd_ptr = json_get_cmd(g_json_str_buffer, json_len);
    if (cmd_ptr == NULL) {
        NRF_LOG_WARNING("No cmd field in JSON");
        NRF_LOG_FLUSH();
        json_protocol_reset();
        return;
    }
    
    // Extract command string (cmd_ptr points to string content, need to get length)
    uint16_t cmd_len = get_string_len(cmd_ptr);
    if (cmd_len == 0 || cmd_len > 32) {
        NRF_LOG_WARNING("Invalid cmd length: %d", cmd_len);
        NRF_LOG_FLUSH();
        json_protocol_reset();
        return;
    }
    
    // Copy command to temporary buffer for comparison (avoid modifying original)
    static char cmd_buffer[32];
    if (cmd_len >= sizeof(cmd_buffer)) cmd_len = sizeof(cmd_buffer) - 1;
    memcpy(cmd_buffer, cmd_ptr, cmd_len);
    cmd_buffer[cmd_len] = '\0';
    const char *cmd = cmd_buffer;
    
    int id = json_get_id(g_json_str_buffer, json_len);
    
    NRF_LOG_INFO("Command: %s, ID: %d", cmd, id);
    NRF_LOG_FLUSH();
    
    // Process command
    if (strcmp(cmd, "set_image") == 0) {
        handle_set_image(g_json_str_buffer, json_len, id);
    }
    else if (strcmp(cmd, "reset") == 0) {
        handle_reset();
    }
    else if (strcmp(cmd, "set_brightness") == 0) {
        handle_set_brightness(g_json_str_buffer, json_len);
    }
    else if (strcmp(cmd, "get_status") == 0) {
        handle_get_status(id);
    }
    else {
        NRF_LOG_WARNING("Unknown command: %s", cmd);
        NRF_LOG_FLUSH();
        if (id >= 0) {
            json_protocol_send_error(id, "UNKNOWN_CMD", "Unknown command");
        }
    }
    
    // Reset buffer for next message
    json_protocol_reset();
}

static void handle_set_image(const char *json, uint16_t json_len, int id) {
    // Find data.pixels (Base64 encoded)
    const char *data_start = strstr(json, "\"data\"");
    if (data_start == NULL) {
        json_protocol_send_error(id, "INVALID_FORMAT", "No data field");
        return;
    }
    
    // Find pixels field
    const char *pixels_str = json_get_string_value(data_start, "pixels", json_len - (data_start - json));
    if (pixels_str == NULL) {
        json_protocol_send_error(id, "INVALID_FORMAT", "No pixels field");
        return;
    }
    
    // Get string length
    uint16_t pixels_len = get_string_len(pixels_str);
    if (pixels_len == 0) {
        json_protocol_send_error(id, "INVALID_FORMAT", "Empty pixels data");
        return;
    }
    
    // Get brightness (optional)
    int brightness = json_get_int_value(data_start, "brightness", json_len - (data_start - json), 255);
    if (brightness < 0) brightness = 0;
    if (brightness > 255) brightness = 255;
    g_brightness = (uint8_t)brightness;
    
    // Decode Base64 (use static buffer to avoid stack overflow)
    static uint8_t decoded_data[PIXEL_DATA_SIZE + 16]; // Extra space for safety
    int decoded_len = base64_decode(pixels_str, pixels_len, decoded_data, sizeof(decoded_data));
    
    if (decoded_len != PIXEL_DATA_SIZE) {
        NRF_LOG_WARNING("Decoded size mismatch: %d != %d", decoded_len, PIXEL_DATA_SIZE);
        NRF_LOG_FLUSH();
        json_protocol_send_error(id, "INVALID_SIZE", "Invalid pixel data size");
        return;
    }
    
    // Store and apply
    memcpy(g_static_image, decoded_data, PIXEL_DATA_SIZE);
    apply_pixel_data_to_matrix(g_static_image, g_brightness);
    g_display_mode = DISPLAY_MODE_IMAGE;
    
    matrix_show();
    
    json_protocol_send_response("ack", id, "ok", "Image set successfully");
    NRF_LOG_INFO("Image set successfully");
    NRF_LOG_FLUSH();
}

static void handle_reset(void) {
    g_display_mode = DISPLAY_MODE_IDLE;
    matrix_clear();
    matrix_show();
    NRF_LOG_INFO("Reset");
    NRF_LOG_FLUSH();
}

static void handle_set_brightness(const char *json, uint16_t json_len) {
    const char *data_start = strstr(json, "\"data\"");
    if (data_start == NULL) return;
    
    int brightness = json_get_int_value(data_start, "brightness", json_len - (data_start - json), 255);
    if (brightness < 0) brightness = 0;
    if (brightness > 255) brightness = 255;
    
    g_brightness = (uint8_t)brightness;
    
    // Re-apply current image with new brightness
    if (g_display_mode == DISPLAY_MODE_IMAGE) {
        apply_pixel_data_to_matrix(g_static_image, g_brightness);
        matrix_show();
    }
    
    NRF_LOG_INFO("Brightness set to %d", g_brightness);
    NRF_LOG_FLUSH();
}

static void handle_get_status(int id) {
    const char *mode_str = "idle";
    if (g_display_mode == DISPLAY_MODE_IMAGE) mode_str = "image";
    
    snprintf(g_status_json_buffer, sizeof(g_status_json_buffer),
        "{\"cmd\":\"status\",\"status\":\"ok\",\"data\":{"
        "\"mode\":\"%s\",\"brightness\":%d}}",
        mode_str, g_brightness);
    
    uint16_t len = (uint16_t)strlen(g_status_json_buffer);
    ble_nus_t *p_nus = get_ble_nus_instance();
    (void)ble_nus_data_send(p_nus, (uint8_t*)g_status_json_buffer, &len, m_conn_handle);
}

static void apply_pixel_data_to_matrix(const uint8_t *pixel_data, uint8_t brightness) {
    matrix_clear();
    
    for (uint16_t i = 0; i < MATRIX_N; i++) {
        uint8_t r = pixel_data[i * 3 + 0];
        uint8_t g = pixel_data[i * 3 + 1];
        uint8_t b = pixel_data[i * 3 + 2];
        
        // Apply brightness
        r = (r * brightness) / 255;
        g = (g * brightness) / 255;
        b = (b * brightness) / 255;
        
        uint8_t row = (uint8_t)(i / MATRIX_W);
        uint8_t col = (uint8_t)(i % MATRIX_W);
        matrix_set_pixel(row, col, r, g, b);
    }
}

void set_global_brightness(uint8_t brightness) {
    g_brightness = brightness;
}

uint8_t get_global_brightness(void) {
    return g_brightness;
}

display_mode_t get_display_mode(void) {
    return g_display_mode;
}
