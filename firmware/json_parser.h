/**
 * Simple JSON parser for BLE LED Dongle protocol
 * Lightweight implementation for embedded systems
 */

#ifndef JSON_PARSER_H
#define JSON_PARSER_H

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

#define JSON_MAX_STRING_LEN 512
#define JSON_MAX_NESTING 4

typedef enum {
    JSON_TYPE_NULL,
    JSON_TYPE_BOOL,
    JSON_TYPE_NUMBER,
    JSON_TYPE_STRING,
    JSON_TYPE_OBJECT,
    JSON_TYPE_ARRAY
} json_type_t;

typedef struct json_value {
    json_type_t type;
    union {
        bool bool_val;
        int32_t int_val;
        float float_val;
        char *string_val;
        struct json_object *object_val;
        struct json_array *array_val;
    } value;
} json_value_t;

typedef struct json_object {
    char *key;
    json_value_t *value;
    struct json_object *next;
} json_object_t;

typedef struct json_array {
    json_value_t *value;
    struct json_array *next;
} json_array_t;

// Simple JSON parser - returns pointer to value or NULL
json_value_t* json_parse(const char *json_str, uint16_t len);
void json_free(json_value_t *value);

// Get value from object by key
json_value_t* json_get_object_value(json_value_t *obj, const char *key);
json_value_t* json_get_array_item(json_value_t *arr, uint16_t index);

// Get primitive values
bool json_get_bool(json_value_t *val, bool default_val);
int32_t json_get_int(json_value_t *val, int32_t default_val);
float json_get_float(json_value_t *val, float default_val);
const char* json_get_string(json_value_t *val, const char *default_val);

// Helper functions
const char* json_get_string_value(const char *json, const char *key, uint16_t json_len);
int32_t json_get_int_value(const char *json, const char *key, uint16_t json_len, int32_t default_val);
bool json_get_bool_value(const char *json, const char *key, uint16_t json_len, bool default_val);
const char* json_get_cmd(const char *json, uint16_t json_len);
int32_t json_get_id(const char *json, uint16_t json_len);
uint16_t get_string_len(const char *str);
int json_create_error(char *buffer, uint16_t buffer_size, int id, const char *code, const char *message);
int json_create_progress(char *buffer, uint16_t buffer_size, int id, int chunk_id, int total_chunks, int progress);

// Create JSON response string
int json_create_response(char *buffer, uint16_t buffer_size, 
                         const char *cmd, int id, const char *status, 
                         const char *message);

#ifdef __cplusplus
}
#endif

#endif // JSON_PARSER_H
