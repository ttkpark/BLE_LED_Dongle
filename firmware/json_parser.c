/**
 * Simple JSON parser implementation
 * Note: This is a minimal implementation for embedded use
 * For production, consider using cJSON library
 */

#include "json_parser.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "nrf_log.h"

// Static buffer to avoid stack overflow (reduced size)
static char g_search_key_buffer[32];  // Reduced from 64

// Simple string extraction (finds value after key)
// Lightweight implementation to avoid stack overflow
static const char* find_json_value(const char *json, const char *key, uint16_t json_len) {
    // Build search key manually to avoid snprintf stack usage
    g_search_key_buffer[0] = '"';
    uint8_t i = 1;
    while (key[i-1] != '\0' && i < sizeof(g_search_key_buffer) - 2) {
        g_search_key_buffer[i] = key[i-1];
        i++;
    }
    g_search_key_buffer[i++] = '"';
    g_search_key_buffer[i] = '\0';
    
    // Simple strstr implementation to avoid stack usage
    const char *key_pos = NULL;
    const char *haystack = json;
    while (*haystack != '\0') {
        const char *needle = g_search_key_buffer;
        const char *h = haystack;
        while (*h == *needle && *needle != '\0') {
            h++;
            needle++;
        }
        if (*needle == '\0') {
            key_pos = haystack;
            break;
        }
        haystack++;
    }
    if (key_pos == NULL) return NULL;
    
    // Find colon after key (simple loop instead of strchr)
    const char *colon = key_pos;
    while (*colon != '\0' && *colon != ':') colon++;
    if (*colon == '\0') return NULL;
    
    // Skip whitespace
    const char *value_start = colon + 1;
    while (*value_start == ' ' || *value_start == '\t') value_start++;
    
    return value_start;
}

// Extract integer value (lightweight implementation to avoid stack overflow)
static int32_t extract_int(const char *str, int32_t default_val) {
    if (str == NULL) return default_val;
    
    // Skip to first digit or minus sign (avoid isspace to save stack)
    while (*str != '\0' && (*str < '0' || *str > '9') && *str != '-') {
        str++;
    }
    if (*str == '\0') return default_val;
    
    // Simple atoi implementation (avoid strtol to save stack)
    int32_t sign = 1;
    int32_t result = 0;
    
    if (*str == '-') {
        sign = -1;
        str++;
    }
    
    while (*str >= '0' && *str <= '9') {
        result = result * 10 + (*str - '0');
        str++;
    }
    
    return result * sign;
}

// Extract boolean value
static bool extract_bool(const char *str, bool default_val) {
    if (str == NULL) return default_val;
    
    // Skip whitespace
    while (*str == ' ' || *str == '\t') str++;
    
    if (strncmp(str, "true", 4) == 0) return true;
    if (strncmp(str, "false", 5) == 0) return false;
    
    return default_val;
}

// Extract string value (returns pointer to start of string, caller must handle quotes)
// Lightweight implementation to avoid stack overflow
// Returns pointer to string content (after opening quote), caller should use get_string_len() to get length
static const char* extract_string(const char *str) {
    if (str == NULL) return NULL;
    
    // Skip whitespace (avoid isspace to save stack)
    while (*str == ' ' || *str == '\t' || *str == '\r' || *str == '\n') {
        str++;
    }
    
    // Find opening quote (simple loop instead of strchr to save stack)
    while (*str != '\0' && *str != '"') {
        str++;
    }
    if (*str == '\0') return NULL;
    
    return str + 1; // Return after opening quote
}

// Get string length until closing quote
uint16_t get_string_len(const char *str) {
    if (str == NULL) return 0;
    
    uint16_t len = 0;
    while (str[len] != '\0' && str[len] != '"') {
        if (str[len] == '\\' && str[len + 1] != '\0') {
            len += 2; // Skip escaped character
        } else {
            len++;
        }
    }
    
    return len;
}

// Simple JSON value getters
const char* json_get_string_value(const char *json, const char *key, uint16_t json_len) {
    const char *value_start = find_json_value(json, key, json_len);
    if (value_start == NULL) return NULL;
    
    return extract_string(value_start);
}

int32_t json_get_int_value(const char *json, const char *key, uint16_t json_len, int32_t default_val) {
    const char *value_start = find_json_value(json, key, json_len);
    if (value_start == NULL) return default_val;
    
    return extract_int(value_start, default_val);
}

bool json_get_bool_value(const char *json, const char *key, uint16_t json_len, bool default_val) {
    const char *value_start = find_json_value(json, key, json_len);
    if (value_start == NULL) return default_val;
    
    return extract_bool(value_start, default_val);
}

// Get command string
const char* json_get_cmd(const char *json, uint16_t json_len) {
    return json_get_string_value(json, "cmd", json_len);
}

// Get request ID
int32_t json_get_id(const char *json, uint16_t json_len) {
    return json_get_int_value(json, "id", json_len, -1);
}

// Create JSON response
int json_create_response(char *buffer, uint16_t buffer_size, 
                         const char *cmd, int id, const char *status, 
                         const char *message) {
    if (buffer == NULL || buffer_size == 0) return -1;
    
    if (message != NULL) {
        return snprintf(buffer, buffer_size,
            "{\"cmd\":\"%s\",\"id\":%d,\"status\":\"%s\",\"data\":{\"message\":\"%s\"}}\n",
            cmd, id, status, message);
    } else {
        return snprintf(buffer, buffer_size,
            "{\"cmd\":\"%s\",\"id\":%d,\"status\":\"%s\"}\n",
            cmd, id, status);
    }
}

// Create error response
int json_create_error(char *buffer, uint16_t buffer_size, 
                      int id, const char *code, const char *message) {
    if (buffer == NULL || buffer_size == 0) return -1;
    
    return snprintf(buffer, buffer_size,
        "{\"cmd\":\"error\",\"id\":%d,\"status\":\"error\",\"data\":{\"code\":\"%s\",\"message\":\"%s\"}}\n",
        id, code, message);
}

// Create progress response
int json_create_progress(char *buffer, uint16_t buffer_size,
                         int id, int chunk_id, int total_chunks, int progress) {
    if (buffer == NULL || buffer_size == 0) return -1;
    
    return snprintf(buffer, buffer_size,
        "{\"cmd\":\"progress\",\"id\":%d,\"status\":\"ok\",\"data\":{\"chunk_id\":%d,\"total_chunks\":%d,\"progress\":%d}}\n",
        id, chunk_id, total_chunks, progress);
}
