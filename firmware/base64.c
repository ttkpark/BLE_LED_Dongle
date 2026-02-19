/**
 * Base64 decoder implementation
 */

#include "base64.h"
#include <string.h>

static const char base64_chars[] = 
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

static int base64_char_value(char c) {
    if (c >= 'A' && c <= 'Z') return c - 'A';
    if (c >= 'a' && c <= 'z') return c - 'a' + 26;
    if (c >= '0' && c <= '9') return c - '0' + 52;
    if (c == '+') return 62;
    if (c == '/') return 63;
    if (c == '=') return 0; // Padding
    return -1; // Invalid
}

int base64_decode(const char *input, uint16_t input_len, 
                  uint8_t *output, uint16_t output_size) {
    if (input == NULL || output == NULL || output_size == 0) {
        return -1;
    }
    
    uint16_t output_len = 0;
    uint32_t buffer = 0;
    uint8_t bits_collected = 0;
    
    for (uint16_t i = 0; i < input_len && output_len < output_size; i++) {
        char c = input[i];
        
        // Skip whitespace
        if (c == ' ' || c == '\t' || c == '\n' || c == '\r') {
            continue;
        }
        
        int value = base64_char_value(c);
        if (value < 0) {
            // Invalid character, but continue (might be padding)
            if (c == '=') {
                // Padding - we're done
                break;
            }
            continue;
        }
        
        buffer = (buffer << 6) | value;
        bits_collected += 6;
        
        if (bits_collected >= 8) {
            output[output_len++] = (buffer >> (bits_collected - 8)) & 0xFF;
            bits_collected -= 8;
        }
    }
    
    return output_len;
}
