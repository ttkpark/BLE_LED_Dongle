/**
 * State machine: 1ms SysTick → app_scheduler → LED rainbow every 1s + serial→RTT echo.
 * SysTick pushes sm_tick_handler to scheduler; main loop runs app_sched_execute().
 */

#include <math.h>
#include <stdbool.h>
#include "nrf.h"
#include "nrf_gpio.h"
#include "app_error.h"
#include "app_scheduler.h"
#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
#include "led_matrix.h"
#include "SEGGER_RTT.h"
#include "core_cm4.h"

#define SERIAL_RX_BUF_SIZE   256
#define TICKS_PER_LED_UPDATE 1000   /* 1s = 1000 × 1ms */

#define SCHED_MAX_EVENT_SIZE 0
#define SCHED_QUEUE_SIZE     16

/* Serial RX ringbuffer (e.g. from BLE NUS later) */
static uint8_t  serial_rx_buf[SERIAL_RX_BUF_SIZE];
static volatile uint8_t serial_rx_head;
static uint8_t  serial_rx_tail;

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

static uint32_t sm_tick_count;
static const float phase = 2.f * (float)M_PI / 3.f;
static const float max_val = 5.f;

static void serial_rx_push(uint8_t byte)
{
    uint8_t next = (uint8_t)(serial_rx_head + 1);
    if (next != serial_rx_tail)
    {
        serial_rx_buf[serial_rx_head] = byte;
        serial_rx_head = next;
    }
}

static bool serial_rx_available(void)
{
    return serial_rx_tail != serial_rx_head;
}

static bool serial_rx_get(uint8_t *out)
{
    if (!out || !serial_rx_available())
        return false;
    *out = serial_rx_buf[serial_rx_tail];
    serial_rx_tail = (uint8_t)(serial_rx_tail + 1);
    return true;
}

void serial_rx_inject(const uint8_t *data, uint16_t len)
{
    if (!data) return;
    for (uint16_t i = 0; i < len; i++)
        serial_rx_push(data[i]);
}

static void run_rainbow_frame(void)
{
    for (int i = 0; i < 144; i++)
    {
        float wave = ((i / 12) + (i % 12)) * 0.5f + (float)sm_tick_count / 100.f;
        float r = max_val * (sinf(wave) + 1.f);
        float g = max_val * (sinf(wave + phase) + 1.f);
        float b = max_val * (sinf(wave + 2.f * phase) + 1.f);
        matrix_set_pixel((uint8_t)(i / MATRIX_W), (uint8_t)(i % MATRIX_W),
                         (uint8_t)r, (uint8_t)g, (uint8_t)b);
    }
    matrix_show();
}

static void sm_tick_handler(void *p_event_data, uint16_t event_size)
{
    (void)p_event_data;
    (void)event_size;

    sm_tick_count++;

    if ((sm_tick_count % 10) == 0)
        run_rainbow_frame();

    if (serial_rx_available())
    {
        uint8_t b;
        while (serial_rx_get(&b))
            SEGGER_RTT_Write(0, (const char *)&b, 1);
        SEGGER_RTT_WriteString(0, "\r\n");
    }
}

void SysTick_Handler(void)
{
    uint32_t err = app_sched_event_put(NULL, 0, sm_tick_handler);
    (void)err;
}

static void timers_init(void)
{
    if (SysTick_Config(SystemCoreClock / 1000u) != 0u)
        SysTick_Config(32000u);
}

int main(void)
{
    SEGGER_RTT_WriteString(0, "\r\n>>> State machine: 1ms SysTick, rainbow 1s, serial->RTT\r\n");

    (void)NRF_LOG_INIT(NULL);
    NRF_LOG_DEFAULT_BACKENDS_INIT();

    APP_SCHED_INIT(SCHED_MAX_EVENT_SIZE, SCHED_QUEUE_SIZE);

    nrf_gpio_cfg_output(MATRIX_DATA_PIN);
    ws2812_send_reset();

    serial_rx_head = 0;
    serial_rx_tail = 0;
    sm_tick_count  = 0;

    timers_init();

    run_rainbow_frame();

    while (1)
    {
        app_sched_execute();
    }
}
