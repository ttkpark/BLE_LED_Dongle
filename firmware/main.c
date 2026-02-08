/**
 * Panel full dim RGB(0.1,0.1,0.1), 1 sec timer: serial output once per second.
 */

#include "nrf.h"
#include "nrf_gpio.h"
#include "app_error.h"
#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
#include "led_matrix.h"
#include "SEGGER_RTT.h"

#define MATRIX_DISABLED  0
#define STATUS_LED_PIN   12

/* ~1 second at 64 MHz (no app_timer). */
static void delay_1sec(void)
{
    for (volatile uint32_t i = 0; i < 8000000u; i++) { (void)i; }
}

int main(void)
{
    nrf_gpio_cfg_output(STATUS_LED_PIN);
    nrf_gpio_pin_set(STATUS_LED_PIN);
    SEGGER_RTT_WriteString(0, "\r\n>>> 1s tick + panel RGB(0.1,0.1,0.1)\r\n");

    (void)NRF_LOG_INIT(NULL);
    NRF_LOG_DEFAULT_BACKENDS_INIT();

    /* RGB(0.1, 0.1, 0.1) -> 0..255 scale: 0.1*255 = 25.5 -> 26 */
    const uint8_t dim = 26;

    uint32_t tick = 0;
    while (1)
    {
        delay_1sec();
#if !MATRIX_DISABLED
        matrix_fill(dim, dim, dim);
        matrix_show();
#endif
        /* Serial once per second to verify 1s timer */
        SEGGER_RTT_WriteString(0, "tick ");
        {
            char buf[12];
            int i = 0;
            uint32_t t = tick;
            do { buf[i++] = (char)('0' + (t % 10)); t /= 10; } while (t);
            while (i--) SEGGER_RTT_Write(0, &buf[i], 1);
        }
        SEGGER_RTT_WriteString(0, "\r\n");
        NRF_LOG_INFO("tick %u", (unsigned)tick);
        tick++;
        while (NRF_LOG_PROCESS() == true) { }
    }
}
