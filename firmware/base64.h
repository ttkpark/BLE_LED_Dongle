/**
 * Base64 decoder for embedded systems
 */

#ifndef BASE64_H
#define BASE64_H

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Decode Base64 string to binary data
 * @param input Base64 encoded string
 * @param input_len Length of input string
 * @param output Output buffer for decoded data
 * @param output_size Size of output buffer
 * @return Number of bytes decoded, or -1 on error
 */
int base64_decode(const char *input, uint16_t input_len, 
                  uint8_t *output, uint16_t output_size);

#ifdef __cplusplus
}
#endif

#endif // BASE64_H
