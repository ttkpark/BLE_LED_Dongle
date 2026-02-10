/**
 * State machine: 1ms SysTick → app_scheduler → LED rainbow every 1s + serial→RTT echo.
 * SysTick pushes sm_tick_handler to scheduler; main loop runs app_sched_execute().
 * BLE NUS integrated: BLE terminal data → serial_rx_inject → state machine.
 */

#include <math.h>
#include <stdbool.h>
#include <string.h>
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
#include "nrf_sdh.h"
#include "nrf_sdh_ble.h"
#include "nrf_ble_gatt.h"
#include "nrf_ble_qwr.h"
#include "ble_advertising.h"
#include "ble_conn_params.h"
#include "ble_nus.h"
#include "nrf_pwr_mgmt.h"
#include "app_timer.h"
#include "bsp.h"

#define SERIAL_RX_BUF_SIZE   256
#define TICKS_PER_LED_UPDATE 1000   /* 1s = 1000 × 1ms */

#define SCHED_MAX_EVENT_SIZE 0
#define SCHED_QUEUE_SIZE     16

/* BLE configuration */
#define DEVICE_NAME          "BLE_LED_Dongle"
#define APP_BLE_CONN_CFG_TAG  1
#define APP_BLE_OBSERVER_PRIO 3

#define APP_ADV_INTERVAL     64      /* 40ms in units of 0.625ms */
#define APP_ADV_DURATION     180     /* 180 seconds */
#define APP_ADV_SLOW_INTERVAL 1600    /* 1s in units of 0.625ms */
#define APP_ADV_SLOW_DURATION 0      /* 0 = infinite */

/* Advertising UUIDs - NUS service UUID from ble_nus.h */
#define APP_BLE_UUID_TYPE BLE_UUID_TYPE_VENDOR_BEGIN
/* BLE_UUID_NUS_SERVICE is defined in ble_nus.h */
static ble_uuid_t m_adv_uuids[] = {{BLE_UUID_NUS_SERVICE, APP_BLE_UUID_TYPE}};

/* BLE instances */
static ble_nus_t                        m_nus;
static nrf_ble_gatt_t                   m_gatt;
static nrf_ble_qwr_t                    m_qwr;
static ble_advertising_t                m_advertising;

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

/* BLE NUS event handler: called when data is received via BLE */
static void nus_data_handler(ble_nus_evt_t *p_evt)
{
    if (p_evt->type == BLE_NUS_EVT_RX_DATA)
    {
        serial_rx_inject(p_evt->params.rx_data.p_data, p_evt->params.rx_data.length);
    }
}

/* Advertising event handler (forward declaration) */
static void on_adv_evt(ble_adv_evt_t ble_adv_evt);

/* BLE event handler */
static void ble_evt_handler(ble_evt_t const *p_ble_evt, void *p_context)
{
    uint32_t err_code;

    switch (p_ble_evt->header.evt_id)
    {
        case BLE_GAP_EVT_CONNECTED:
            NRF_LOG_INFO("Connected");
            #ifdef BSP_INDICATE_CONNECTED
            err_code = bsp_indication_set(BSP_INDICATE_CONNECTED);
            APP_ERROR_CHECK(err_code);
            #endif
            break;

        case BLE_GAP_EVT_DISCONNECTED:
            NRF_LOG_INFO("Disconnected");
            #ifdef BSP_INDICATE_DISCONNECTED
            err_code = bsp_indication_set(BSP_INDICATE_DISCONNECTED);
            APP_ERROR_CHECK(err_code);
            #endif
            err_code = ble_advertising_start(&m_advertising, BLE_ADV_MODE_FAST);
            APP_ERROR_CHECK(err_code);
            break;

        case BLE_GAP_EVT_SEC_PARAMS_REQUEST:
            err_code = sd_ble_gap_sec_params_reply(p_ble_evt->evt.gap_evt.conn_handle,
                                                    BLE_GAP_SEC_STATUS_SUCCESS,
                                                    NULL, NULL);
            APP_ERROR_CHECK(err_code);
            break;

        case BLE_GATTS_EVT_SYS_ATTR_MISSING:
            err_code = sd_ble_gatts_sys_attr_set(p_ble_evt->evt.gatts_evt.conn_handle,
                                                  NULL, 0, 0);
            APP_ERROR_CHECK(err_code);
            break;

        default:
            break;
    }
}

/* Check if SoftDevice is present in flash */
static bool check_softdevice_present(void)
{
    // SoftDevice typically starts at 0x0 with a specific header
    // Check for SoftDevice signature at address 0x0
    volatile uint32_t *flash_start = (volatile uint32_t *)0x0;
    uint32_t first_word = flash_start[0];
    uint32_t second_word = flash_start[1];
    
    // SoftDevice usually has non-zero, non-0xFFFFFFFF values at start
    // If flash is erased (0xFFFFFFFF) or all zeros, SoftDevice is likely missing
    if (first_word == 0xFFFFFFFF || first_word == 0x00000000)
    {
        NRF_LOG_ERROR("SoftDevice not detected at 0x0 (flash appears erased)");
        NRF_LOG_ERROR("First word: 0x%08X, Second word: 0x%08X", first_word, second_word);
        return false;
    }
    
    NRF_LOG_INFO("SoftDevice signature found at 0x0: 0x%08X 0x%08X", first_word, second_word);
    
    // Additional check: verify SoftDevice vector table
    // SoftDevice should have a valid vector table at 0x0
    volatile uint32_t *vectors = (volatile uint32_t *)0x0;
    uint32_t stack_ptr = vectors[0];      // Initial stack pointer
    uint32_t reset_handler = vectors[1];  // Reset handler is at offset 4 (index 1)
    
    NRF_LOG_INFO("Vector table: SP=0x%08X, Reset=0x%08X", stack_ptr, reset_handler);
    
    // Check if reset handler points to a reasonable address
    // SoftDevice reset handler should be in the range 0x100-0x19000 (SoftDevice flash area)
    // Note: 0x00000A81 (2689) is actually valid - it's in the SoftDevice range
    if (reset_handler == 0x00000000 || reset_handler == 0xFFFFFFFF)
    {
        NRF_LOG_ERROR("SoftDevice vector table is INVALID: Reset handler = 0x%08X", reset_handler);
        NRF_LOG_ERROR("This indicates SoftDevice is corrupted or not properly flashed!");
        NRF_LOG_ERROR("Please re-flash SoftDevice S112 to address 0x0");
        NRF_LOG_FLUSH();
        return false;
    }
    else if (reset_handler < 0x100 || reset_handler > 0x19000)
    {
        NRF_LOG_WARNING("SoftDevice vector table may be invalid: Reset handler = 0x%08X", reset_handler);
        NRF_LOG_WARNING("Expected range: 0x100-0x19000 (SoftDevice flash area)");
        NRF_LOG_FLUSH();
        // Don't return false here, but log warning
    }
    else
    {
        NRF_LOG_INFO("SoftDevice vector table looks valid: Reset handler = 0x%08X", reset_handler);
    }
    
    return true;
}

/* BLE stack initialization */
static bool ble_stack_init(void)
{
    uint32_t err_code;

    // First check if SoftDevice is present before attempting to enable
    if (!check_softdevice_present())
    {
        NRF_LOG_ERROR("SoftDevice not found in flash!");
        NRF_LOG_ERROR("Please flash SoftDevice S112 to address 0x0");
        NRF_LOG_ERROR("File: s112_nrf52_7.2.0_softdevice.hex");
        NRF_LOG_FLUSH();
        return false;
    }

    NRF_LOG_INFO("Requesting SoftDevice enable...");
    NRF_LOG_FLUSH();
    
    // Log clock configuration before enabling
    NRF_LOG_INFO("Clock config: LF_SRC=%d, LF_ACCURACY=%d", 
                 NRF_SDH_CLOCK_LF_SRC, NRF_SDH_CLOCK_LF_ACCURACY);
    NRF_LOG_FLUSH();
    
    // This will trigger SVC call - if SoftDevice is missing, we'll get stuck here
    // The SVC call itself may hang if SoftDevice can't initialize (e.g., 32MHz crystal missing)
    NRF_LOG_INFO("Calling nrf_sdh_enable_request() - this may hang if 32MHz crystal is missing");
    NRF_LOG_INFO("If stuck here, SoftDevice may be waiting for 32MHz crystal to stabilize");
    NRF_LOG_FLUSH();
    
    // Flush all logs before SVC call (may not return)
    NRF_LOG_FLUSH();
    SEGGER_RTT_WriteString(0, "\r\n[Before SVC] About to call nrf_sdh_enable_request()\r\n");
    
    err_code = nrf_sdh_enable_request();
    
    // If we get here, SVC call completed
    SEGGER_RTT_WriteString(0, "\r\n[After SVC] nrf_sdh_enable_request() returned\r\n");
    NRF_LOG_INFO("nrf_sdh_enable_request() returned: 0x%08X", err_code);
    NRF_LOG_FLUSH();
    
    if (err_code != NRF_SUCCESS)
    {
        NRF_LOG_ERROR("SoftDevice enable request failed: 0x%08X", err_code);
        NRF_LOG_ERROR("Error meanings:");
        NRF_LOG_ERROR("  0x00000001 = Invalid parameter");
        NRF_LOG_ERROR("  0x00000002 = Invalid state");
        NRF_LOG_ERROR("  0x00000003 = Out of memory");
        NRF_LOG_ERROR("  0x00000004 = Not supported");
        NRF_LOG_ERROR("  0x00000005 = Internal error");
        NRF_LOG_ERROR("  0x00000006 = Invalid length");
        NRF_LOG_FLUSH();
        return false;
    }
    NRF_LOG_INFO("SoftDevice enable requested successfully");
    NRF_LOG_FLUSH();

    // Wait for SoftDevice to initialize
    // With APPSH dispatch model, we need to process scheduler events
    NRF_LOG_INFO("Waiting for SoftDevice to initialize...");
    NRF_LOG_FLUSH();
    
    // Process scheduler events while waiting for SoftDevice
    volatile int timeout = 1000000;
    while (timeout-- > 0)
    {
        app_sched_execute();
        if (nrf_sdh_is_enabled())
        {
            NRF_LOG_INFO("SoftDevice is now enabled");
            NRF_LOG_FLUSH();
            break;
        }
        __NOP();
    }
    
    if (!nrf_sdh_is_enabled())
    {
        NRF_LOG_ERROR("SoftDevice enable timeout - may be stuck");
        NRF_LOG_FLUSH();
        return false;
    }
    
    NRF_LOG_INFO("SoftDevice initialization completed");
    NRF_LOG_FLUSH();

    uint32_t ram_start = 0;
    NRF_LOG_INFO("Setting BLE default config...");
    NRF_LOG_FLUSH();
    err_code = nrf_sdh_ble_default_cfg_set(APP_BLE_CONN_CFG_TAG, &ram_start);
    if (err_code != NRF_SUCCESS)
    {
        NRF_LOG_ERROR("BLE config set failed: 0x%08X", err_code);
        NRF_LOG_FLUSH();
        return false;
    }
    NRF_LOG_INFO("BLE config set, RAM start: 0x%08X", ram_start);
    NRF_LOG_FLUSH();

    NRF_LOG_INFO("Enabling BLE stack...");
    NRF_LOG_FLUSH();
    err_code = nrf_sdh_ble_enable(&ram_start);
    if (err_code != NRF_SUCCESS)
    {
        NRF_LOG_ERROR("BLE stack enable failed: 0x%08X", err_code);
        NRF_LOG_ERROR("Check: 1) 32MHz crystal connected? 2) SoftDevice flashed?");
        NRF_LOG_FLUSH();
        return false;
    }
    NRF_LOG_INFO("BLE stack enabled");
    NRF_LOG_FLUSH();

    NRF_SDH_BLE_OBSERVER(m_ble_observer, APP_BLE_OBSERVER_PRIO, ble_evt_handler, NULL);
    return true;
}

/* GATT module initialization */
static void gatt_init(void)
{
    ret_code_t err_code = nrf_ble_gatt_init(&m_gatt, NULL);
    APP_ERROR_CHECK(err_code);
}

/* Queued writes module initialization */
static void qwr_init(void)
{
    ret_code_t err_code;
    nrf_ble_qwr_init_t qwr_init = {0};

    qwr_init.error_handler = NULL;

    err_code = nrf_ble_qwr_init(&m_qwr, &qwr_init);
    APP_ERROR_CHECK(err_code);
}

/* NUS service initialization */
static void services_init(void)
{
    uint32_t           err_code;
    ble_nus_init_t     nus_init;

    memset(&nus_init, 0, sizeof(nus_init));

    nus_init.data_handler = nus_data_handler;

    err_code = ble_nus_init(&m_nus, &nus_init);
    APP_ERROR_CHECK(err_code);
}

/* Connection parameters module initialization */
static void conn_params_init(void)
{
    uint32_t               err_code;
    ble_conn_params_init_t cp_init;

    memset(&cp_init, 0, sizeof(cp_init));

    cp_init.p_conn_params                  = NULL;
    cp_init.first_conn_params_update_delay = APP_TIMER_TICKS(5000);
    cp_init.next_conn_params_update_delay  = APP_TIMER_TICKS(30000);
    cp_init.max_conn_params_update_count    = 3;
    cp_init.start_on_notify_cccd_handle    = BLE_GATT_HANDLE_INVALID;
    cp_init.disconnect_on_fail              = false;
    cp_init.evt_handler                     = NULL;
    cp_init.error_handler                    = NULL;

    err_code = ble_conn_params_init(&cp_init);
    APP_ERROR_CHECK(err_code);
}

/* Advertising initialization */
static void advertising_init(void)
{
    uint32_t               err_code;
    ble_advertising_init_t init;

    memset(&init, 0, sizeof(init));

    init.advdata.name_type               = BLE_ADVDATA_FULL_NAME;
    init.advdata.include_appearance      = true;
    init.advdata.flags                   = BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE;
    init.advdata.uuids_complete.uuid_cnt = sizeof(m_adv_uuids) / sizeof(m_adv_uuids[0]);
    init.advdata.uuids_complete.p_uuids  = m_adv_uuids;

    init.config.ble_adv_fast_enabled  = true;
    init.config.ble_adv_fast_interval = APP_ADV_INTERVAL;
    init.config.ble_adv_fast_timeout  = APP_ADV_DURATION;
    init.config.ble_adv_slow_enabled  = true;
    init.config.ble_adv_slow_interval = APP_ADV_SLOW_INTERVAL;
    init.config.ble_adv_slow_timeout  = APP_ADV_SLOW_DURATION;

    init.evt_handler = on_adv_evt;

    err_code = ble_advertising_init(&m_advertising, &init);
    APP_ERROR_CHECK(err_code);

    ble_advertising_conn_cfg_tag_set(&m_advertising, APP_BLE_CONN_CFG_TAG);
}

/* Advertising event handler */
static void on_adv_evt(ble_adv_evt_t ble_adv_evt)
{
    uint32_t err_code;

    switch (ble_adv_evt)
    {
        case BLE_ADV_EVT_FAST:
            #ifdef BSP_INDICATE_ADVERTISING
            err_code = bsp_indication_set(BSP_INDICATE_ADVERTISING);
            APP_ERROR_CHECK(err_code);
            #endif
            break;
        case BLE_ADV_EVT_IDLE:
            #ifdef BSP_INDICATE_IDLE
            err_code = bsp_indication_set(BSP_INDICATE_IDLE);
            APP_ERROR_CHECK(err_code);
            #endif
            break;
        default:
            break;
    }
}

int main(void)
{
    uint32_t err_code;

    SEGGER_RTT_WriteString(0, "\r\n>>> State machine: 1ms SysTick, rainbow 1s, BLE NUS terminal\r\n");

    (void)NRF_LOG_INIT(NULL);
    NRF_LOG_DEFAULT_BACKENDS_INIT();

    APP_SCHED_INIT(SCHED_MAX_EVENT_SIZE, SCHED_QUEUE_SIZE);

    nrf_gpio_cfg_output(MATRIX_DATA_PIN);
    ws2812_send_reset();

    serial_rx_head = 0;
    serial_rx_tail = 0;
    sm_tick_count  = 0;

    /* Initialize BLE */
    err_code = nrf_pwr_mgmt_init();
    APP_ERROR_CHECK(err_code);

    err_code = app_timer_init();
    APP_ERROR_CHECK(err_code);

    #ifdef BSP_INIT_LEDS
    err_code = bsp_init(BSP_INIT_LEDS, NULL);
    APP_ERROR_CHECK(err_code);
    #endif

    /* BLE initialization - Set to 0 to enable BLE, 1 to disable for testing */
    #define TEST_WITHOUT_SOFTDEVICE 0  // Change to 1 to test without BLE
    
    #if TEST_WITHOUT_SOFTDEVICE
    NRF_LOG_INFO("=== TEST MODE: Running WITHOUT SoftDevice/BLE ===");
    NRF_LOG_INFO("LED matrix and timer should work normally");
    NRF_LOG_INFO("32MHz crystal test: Check if LED updates smoothly");
    NRF_LOG_FLUSH();
    #else
    /* Try to initialize BLE - if 32MHz crystal is missing, this will fail */
    NRF_LOG_INFO("Attempting BLE initialization...");
    NRF_LOG_FLUSH();
    
    bool ble_ok = ble_stack_init();
    if (ble_ok)
    {
        gatt_init();
        qwr_init();
        services_init();
        conn_params_init();
        advertising_init();

        err_code = ble_advertising_start(&m_advertising, BLE_ADV_MODE_FAST);
        if (err_code != NRF_SUCCESS)
        {
            NRF_LOG_ERROR("BLE advertising start failed: 0x%08X", err_code);
            NRF_LOG_FLUSH();
            ble_ok = false;
        }
        else
        {
            NRF_LOG_INFO("BLE initialized and advertising");
            NRF_LOG_FLUSH();
        }
    }
    else
    {
        NRF_LOG_ERROR("BLE initialization failed - continuing without BLE");
        NRF_LOG_ERROR("Possible causes:");
        NRF_LOG_ERROR("  1) 32MHz crystal not connected or faulty");
        NRF_LOG_ERROR("  2) SoftDevice not flashed to 0x0");
        NRF_LOG_ERROR("  3) Power supply issues");
        NRF_LOG_FLUSH();
    }
    #endif

    timers_init();

    run_rainbow_frame();

    NRF_LOG_INFO("BLE LED Dongle started");

    while (1)
    {
        app_sched_execute();
        #if !TEST_WITHOUT_SOFTDEVICE
        nrf_pwr_mgmt_run();
        #endif
    }
}
