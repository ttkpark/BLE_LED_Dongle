	.cpu cortex-m4
	.arch armv7e-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 38, 1
	.eabi_attribute 18, 4
	.file	"ble_advertising.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/ble/ble_advertising/ble_advertising.c"
	.section	.text.sd_mbr_command,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_mbr_command, %function
sd_mbr_command:
.LFB145:
	.file 2 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf52/nrf_mbr.h"
	.loc 2 257 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 2 257 1
	.syntax unified
@ 257 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf52/nrf_mbr.h" 1
	svc #24
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE145:
	.size	sd_mbr_command, .-sd_mbr_command
	.section	.text.sd_ble_gap_addr_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_addr_set, %function
sd_ble_gap_addr_set:
.LFB164:
	.file 3 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h"
	.loc 3 1349 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1349 1
	.syntax unified
@ 1349 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #108
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE164:
	.size	sd_ble_gap_addr_set, .-sd_ble_gap_addr_set
	.section	.text.sd_ble_gap_addr_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_addr_get, %function
sd_ble_gap_addr_get:
.LFB165:
	.loc 3 1362 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1362 1
	.syntax unified
@ 1362 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #109
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE165:
	.size	sd_ble_gap_addr_get, .-sd_ble_gap_addr_get
	.section	.text.sd_ble_gap_adv_addr_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_adv_addr_get, %function
sd_ble_gap_adv_addr_get:
.LFB166:
	.loc 3 1381 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1381 1
	.syntax unified
@ 1381 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #147
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE166:
	.size	sd_ble_gap_adv_addr_get, .-sd_ble_gap_adv_addr_get
	.section	.text.sd_ble_gap_whitelist_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_whitelist_set, %function
sd_ble_gap_whitelist_set:
.LFB167:
	.loc 3 1402 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1402 1
	.syntax unified
@ 1402 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #110
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE167:
	.size	sd_ble_gap_whitelist_set, .-sd_ble_gap_whitelist_set
	.section	.text.sd_ble_gap_device_identities_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_device_identities_set, %function
sd_ble_gap_device_identities_set:
.LFB168:
	.loc 3 1430 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1430 1
	.syntax unified
@ 1430 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #111
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE168:
	.size	sd_ble_gap_device_identities_set, .-sd_ble_gap_device_identities_set
	.section	.text.sd_ble_gap_privacy_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_privacy_set, %function
sd_ble_gap_privacy_set:
.LFB169:
	.loc 3 1452 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1452 1
	.syntax unified
@ 1452 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #112
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE169:
	.size	sd_ble_gap_privacy_set, .-sd_ble_gap_privacy_set
	.section	.text.sd_ble_gap_privacy_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_privacy_get, %function
sd_ble_gap_privacy_get:
.LFB170:
	.loc 3 1466 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1466 1
	.syntax unified
@ 1466 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #113
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE170:
	.size	sd_ble_gap_privacy_get, .-sd_ble_gap_privacy_get
	.section	.text.sd_ble_gap_adv_set_configure,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_adv_set_configure, %function
sd_ble_gap_adv_set_configure:
.LFB171:
	.loc 3 1512 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1512 1
	.syntax unified
@ 1512 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #114
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE171:
	.size	sd_ble_gap_adv_set_configure, .-sd_ble_gap_adv_set_configure
	.section	.text.sd_ble_gap_adv_start,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_adv_start, %function
sd_ble_gap_adv_start:
.LFB172:
	.loc 3 1561 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1561 1
	.syntax unified
@ 1561 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #115
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE172:
	.size	sd_ble_gap_adv_start, .-sd_ble_gap_adv_start
	.section	.text.sd_ble_gap_adv_stop,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_adv_stop, %function
sd_ble_gap_adv_stop:
.LFB173:
	.loc 3 1576 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1576 1
	.syntax unified
@ 1576 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #116
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE173:
	.size	sd_ble_gap_adv_stop, .-sd_ble_gap_adv_stop
	.section	.text.sd_ble_gap_conn_param_update,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_conn_param_update, %function
sd_ble_gap_conn_param_update:
.LFB174:
	.loc 3 1606 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1606 1
	.syntax unified
@ 1606 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #117
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE174:
	.size	sd_ble_gap_conn_param_update, .-sd_ble_gap_conn_param_update
	.section	.text.sd_ble_gap_disconnect,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_disconnect, %function
sd_ble_gap_disconnect:
.LFB175:
	.loc 3 1630 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1630 1
	.syntax unified
@ 1630 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #118
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE175:
	.size	sd_ble_gap_disconnect, .-sd_ble_gap_disconnect
	.section	.text.sd_ble_gap_tx_power_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_tx_power_set, %function
sd_ble_gap_tx_power_set:
.LFB176:
	.loc 3 1657 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1657 1
	.syntax unified
@ 1657 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #119
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE176:
	.size	sd_ble_gap_tx_power_set, .-sd_ble_gap_tx_power_set
	.section	.text.sd_ble_gap_appearance_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_appearance_set, %function
sd_ble_gap_appearance_set:
.LFB177:
	.loc 3 1667 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1667 1
	.syntax unified
@ 1667 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #120
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE177:
	.size	sd_ble_gap_appearance_set, .-sd_ble_gap_appearance_set
	.section	.text.sd_ble_gap_appearance_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_appearance_get, %function
sd_ble_gap_appearance_get:
.LFB178:
	.loc 3 1677 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1677 1
	.syntax unified
@ 1677 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #121
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE178:
	.size	sd_ble_gap_appearance_get, .-sd_ble_gap_appearance_get
	.section	.text.sd_ble_gap_ppcp_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_ppcp_set, %function
sd_ble_gap_ppcp_set:
.LFB179:
	.loc 3 1690 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1690 1
	.syntax unified
@ 1690 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #122
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE179:
	.size	sd_ble_gap_ppcp_set, .-sd_ble_gap_ppcp_set
	.section	.text.sd_ble_gap_ppcp_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_ppcp_get, %function
sd_ble_gap_ppcp_get:
.LFB180:
	.loc 3 1702 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1702 1
	.syntax unified
@ 1702 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #123
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE180:
	.size	sd_ble_gap_ppcp_get, .-sd_ble_gap_ppcp_get
	.section	.text.sd_ble_gap_device_name_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_device_name_set, %function
sd_ble_gap_device_name_set:
.LFB181:
	.loc 3 1720 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1720 1
	.syntax unified
@ 1720 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #124
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE181:
	.size	sd_ble_gap_device_name_set, .-sd_ble_gap_device_name_set
	.section	.text.sd_ble_gap_device_name_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_device_name_get, %function
sd_ble_gap_device_name_get:
.LFB182:
	.loc 3 1737 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1737 1
	.syntax unified
@ 1737 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #125
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE182:
	.size	sd_ble_gap_device_name_get, .-sd_ble_gap_device_name_get
	.section	.text.sd_ble_gap_authenticate,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_authenticate, %function
sd_ble_gap_authenticate:
.LFB183:
	.loc 3 1774 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1774 1
	.syntax unified
@ 1774 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #126
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE183:
	.size	sd_ble_gap_authenticate, .-sd_ble_gap_authenticate
	.section	.text.sd_ble_gap_sec_params_reply,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_sec_params_reply, %function
sd_ble_gap_sec_params_reply:
.LFB184:
	.loc 3 1823 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1823 1
	.syntax unified
@ 1823 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #127
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE184:
	.size	sd_ble_gap_sec_params_reply, .-sd_ble_gap_sec_params_reply
	.section	.text.sd_ble_gap_auth_key_reply,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_auth_key_reply, %function
sd_ble_gap_auth_key_reply:
.LFB185:
	.loc 3 1854 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1854 1
	.syntax unified
@ 1854 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #128
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE185:
	.size	sd_ble_gap_auth_key_reply, .-sd_ble_gap_auth_key_reply
	.section	.text.sd_ble_gap_lesc_dhkey_reply,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_lesc_dhkey_reply, %function
sd_ble_gap_lesc_dhkey_reply:
.LFB186:
	.loc 3 1885 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1885 1
	.syntax unified
@ 1885 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #129
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE186:
	.size	sd_ble_gap_lesc_dhkey_reply, .-sd_ble_gap_lesc_dhkey_reply
	.section	.text.sd_ble_gap_keypress_notify,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_keypress_notify, %function
sd_ble_gap_keypress_notify:
.LFB187:
	.loc 3 1906 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1906 1
	.syntax unified
@ 1906 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #130
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE187:
	.size	sd_ble_gap_keypress_notify, .-sd_ble_gap_keypress_notify
	.section	.text.sd_ble_gap_lesc_oob_data_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_lesc_oob_data_get, %function
sd_ble_gap_lesc_oob_data_get:
.LFB188:
	.loc 3 1926 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1926 1
	.syntax unified
@ 1926 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #131
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE188:
	.size	sd_ble_gap_lesc_oob_data_get, .-sd_ble_gap_lesc_oob_data_get
	.section	.text.sd_ble_gap_lesc_oob_data_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_lesc_oob_data_set, %function
sd_ble_gap_lesc_oob_data_set:
.LFB189:
	.loc 3 1956 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1956 1
	.syntax unified
@ 1956 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #132
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE189:
	.size	sd_ble_gap_lesc_oob_data_set, .-sd_ble_gap_lesc_oob_data_set
	.section	.text.sd_ble_gap_sec_info_reply,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_sec_info_reply, %function
sd_ble_gap_sec_info_reply:
.LFB190:
	.loc 3 1982 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1982 1
	.syntax unified
@ 1982 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #134
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE190:
	.size	sd_ble_gap_sec_info_reply, .-sd_ble_gap_sec_info_reply
	.section	.text.sd_ble_gap_conn_sec_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_conn_sec_get, %function
sd_ble_gap_conn_sec_get:
.LFB191:
	.loc 3 1994 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1994 1
	.syntax unified
@ 1994 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #135
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE191:
	.size	sd_ble_gap_conn_sec_get, .-sd_ble_gap_conn_sec_get
	.section	.text.sd_ble_gap_rssi_start,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_rssi_start, %function
sd_ble_gap_rssi_start:
.LFB192:
	.loc 3 2020 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 2020 1
	.syntax unified
@ 2020 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #136
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE192:
	.size	sd_ble_gap_rssi_start, .-sd_ble_gap_rssi_start
	.section	.text.sd_ble_gap_rssi_stop,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_rssi_stop, %function
sd_ble_gap_rssi_stop:
.LFB193:
	.loc 3 2039 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 2039 1
	.syntax unified
@ 2039 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #137
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE193:
	.size	sd_ble_gap_rssi_stop, .-sd_ble_gap_rssi_stop
	.section	.text.sd_ble_gap_rssi_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_rssi_get, %function
sd_ble_gap_rssi_get:
.LFB194:
	.loc 3 2061 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 2061 1
	.syntax unified
@ 2061 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #142
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE194:
	.size	sd_ble_gap_rssi_get, .-sd_ble_gap_rssi_get
	.section	.text.sd_ble_gap_phy_update,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_phy_update, %function
sd_ble_gap_phy_update:
.LFB195:
	.loc 3 2112 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 2112 1
	.syntax unified
@ 2112 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #143
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE195:
	.size	sd_ble_gap_phy_update, .-sd_ble_gap_phy_update
	.section	.text.sd_ble_gap_next_conn_evt_counter_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_next_conn_evt_counter_get, %function
sd_ble_gap_next_conn_evt_counter_get:
.LFB196:
	.loc 3 2138 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 2138 1
	.syntax unified
@ 2138 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h" 1
	svc #148
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE196:
	.size	sd_ble_gap_next_conn_evt_counter_get, .-sd_ble_gap_next_conn_evt_counter_get
	.section	.text.sd_ble_gattc_primary_services_discover,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_primary_services_discover, %function
sd_ble_gattc_primary_services_discover:
.LFB197:
	.file 4 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h"
	.loc 4 419 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 419 1
	.syntax unified
@ 419 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #155
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE197:
	.size	sd_ble_gattc_primary_services_discover, .-sd_ble_gattc_primary_services_discover
	.section	.text.sd_ble_gattc_relationships_discover,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_relationships_discover, %function
sd_ble_gattc_relationships_discover:
.LFB198:
	.loc 4 447 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 447 1
	.syntax unified
@ 447 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #156
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE198:
	.size	sd_ble_gattc_relationships_discover, .-sd_ble_gattc_relationships_discover
	.section	.text.sd_ble_gattc_characteristics_discover,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_characteristics_discover, %function
sd_ble_gattc_characteristics_discover:
.LFB199:
	.loc 4 474 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 474 1
	.syntax unified
@ 474 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #157
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE199:
	.size	sd_ble_gattc_characteristics_discover, .-sd_ble_gattc_characteristics_discover
	.section	.text.sd_ble_gattc_descriptors_discover,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_descriptors_discover, %function
sd_ble_gattc_descriptors_discover:
.LFB200:
	.loc 4 501 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 501 1
	.syntax unified
@ 501 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #158
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE200:
	.size	sd_ble_gattc_descriptors_discover, .-sd_ble_gattc_descriptors_discover
	.section	.text.sd_ble_gattc_char_value_by_uuid_read,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_char_value_by_uuid_read, %function
sd_ble_gattc_char_value_by_uuid_read:
.LFB201:
	.loc 4 528 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 528 1
	.syntax unified
@ 528 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #160
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE201:
	.size	sd_ble_gattc_char_value_by_uuid_read, .-sd_ble_gattc_char_value_by_uuid_read
	.section	.text.sd_ble_gattc_read,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_read, %function
sd_ble_gattc_read:
.LFB202:
	.loc 4 555 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 555 1
	.syntax unified
@ 555 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #161
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE202:
	.size	sd_ble_gattc_read, .-sd_ble_gattc_read
	.section	.text.sd_ble_gattc_char_values_read,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_char_values_read, %function
sd_ble_gattc_char_values_read:
.LFB203:
	.loc 4 581 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 581 1
	.syntax unified
@ 581 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #162
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE203:
	.size	sd_ble_gattc_char_values_read, .-sd_ble_gattc_char_values_read
	.section	.text.sd_ble_gattc_write,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_write, %function
sd_ble_gattc_write:
.LFB204:
	.loc 4 628 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 628 1
	.syntax unified
@ 628 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #163
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE204:
	.size	sd_ble_gattc_write, .-sd_ble_gattc_write
	.section	.text.sd_ble_gattc_hv_confirm,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_hv_confirm, %function
sd_ble_gattc_hv_confirm:
.LFB205:
	.loc 4 646 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 646 1
	.syntax unified
@ 646 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #164
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE205:
	.size	sd_ble_gattc_hv_confirm, .-sd_ble_gattc_hv_confirm
	.section	.text.sd_ble_gattc_attr_info_discover,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_attr_info_discover, %function
sd_ble_gattc_attr_info_discover:
.LFB206:
	.loc 4 664 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 664 1
	.syntax unified
@ 664 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #159
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE206:
	.size	sd_ble_gattc_attr_info_discover, .-sd_ble_gattc_attr_info_discover
	.section	.text.sd_ble_gattc_exchange_mtu_request,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gattc_exchange_mtu_request, %function
sd_ble_gattc_exchange_mtu_request:
.LFB207:
	.loc 4 697 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 697 1
	.syntax unified
@ 697 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h" 1
	svc #165
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE207:
	.size	sd_ble_gattc_exchange_mtu_request, .-sd_ble_gattc_exchange_mtu_request
	.section	.text.sd_ble_gatts_service_add,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_service_add, %function
sd_ble_gatts_service_add:
.LFB209:
	.file 5 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h"
	.loc 5 446 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 446 1
	.syntax unified
@ 446 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #168
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE209:
	.size	sd_ble_gatts_service_add, .-sd_ble_gatts_service_add
	.section	.text.sd_ble_gatts_include_add,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_include_add, %function
sd_ble_gatts_include_add:
.LFB210:
	.loc 5 472 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 472 1
	.syntax unified
@ 472 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #169
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE210:
	.size	sd_ble_gatts_include_add, .-sd_ble_gatts_include_add
	.section	.text.sd_ble_gatts_characteristic_add,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_characteristic_add, %function
sd_ble_gatts_characteristic_add:
.LFB211:
	.loc 5 501 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 501 1
	.syntax unified
@ 501 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #170
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE211:
	.size	sd_ble_gatts_characteristic_add, .-sd_ble_gatts_characteristic_add
	.section	.text.sd_ble_gatts_descriptor_add,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_descriptor_add, %function
sd_ble_gatts_descriptor_add:
.LFB212:
	.loc 5 524 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 524 1
	.syntax unified
@ 524 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #171
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE212:
	.size	sd_ble_gatts_descriptor_add, .-sd_ble_gatts_descriptor_add
	.section	.text.sd_ble_gatts_value_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_value_set, %function
sd_ble_gatts_value_set:
.LFB213:
	.loc 5 547 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 547 1
	.syntax unified
@ 547 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #172
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE213:
	.size	sd_ble_gatts_value_set, .-sd_ble_gatts_value_set
	.section	.text.sd_ble_gatts_value_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_value_get, %function
sd_ble_gatts_value_get:
.LFB214:
	.loc 5 571 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 571 1
	.syntax unified
@ 571 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #173
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE214:
	.size	sd_ble_gatts_value_get, .-sd_ble_gatts_value_get
	.section	.text.sd_ble_gatts_hvx,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_hvx, %function
sd_ble_gatts_hvx:
.LFB215:
	.loc 5 636 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 636 1
	.syntax unified
@ 636 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #174
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE215:
	.size	sd_ble_gatts_hvx, .-sd_ble_gatts_hvx
	.section	.text.sd_ble_gatts_service_changed,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_service_changed, %function
sd_ble_gatts_service_changed:
.LFB216:
	.loc 5 672 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 672 1
	.syntax unified
@ 672 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #175
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE216:
	.size	sd_ble_gatts_service_changed, .-sd_ble_gatts_service_changed
	.section	.text.sd_ble_gatts_rw_authorize_reply,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_rw_authorize_reply, %function
sd_ble_gatts_rw_authorize_reply:
.LFB217:
	.loc 5 705 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 705 1
	.syntax unified
@ 705 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #176
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE217:
	.size	sd_ble_gatts_rw_authorize_reply, .-sd_ble_gatts_rw_authorize_reply
	.section	.text.sd_ble_gatts_sys_attr_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_sys_attr_set, %function
sd_ble_gatts_sys_attr_set:
.LFB218:
	.loc 5 749 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 749 1
	.syntax unified
@ 749 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #177
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE218:
	.size	sd_ble_gatts_sys_attr_set, .-sd_ble_gatts_sys_attr_set
	.section	.text.sd_ble_gatts_sys_attr_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_sys_attr_get, %function
sd_ble_gatts_sys_attr_get:
.LFB219:
	.loc 5 782 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 782 1
	.syntax unified
@ 782 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #178
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE219:
	.size	sd_ble_gatts_sys_attr_get, .-sd_ble_gatts_sys_attr_get
	.section	.text.sd_ble_gatts_initial_user_handle_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_initial_user_handle_get, %function
sd_ble_gatts_initial_user_handle_get:
.LFB220:
	.loc 5 792 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 792 1
	.syntax unified
@ 792 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #179
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE220:
	.size	sd_ble_gatts_initial_user_handle_get, .-sd_ble_gatts_initial_user_handle_get
	.section	.text.sd_ble_gatts_attr_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_attr_get, %function
sd_ble_gatts_attr_get:
.LFB221:
	.loc 5 805 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 805 1
	.syntax unified
@ 805 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #180
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE221:
	.size	sd_ble_gatts_attr_get, .-sd_ble_gatts_attr_get
	.section	.text.sd_ble_gatts_exchange_mtu_reply,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gatts_exchange_mtu_reply, %function
sd_ble_gatts_exchange_mtu_reply:
.LFB222:
	.loc 5 835 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 835 1
	.syntax unified
@ 835 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h" 1
	svc #181
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE222:
	.size	sd_ble_gatts_exchange_mtu_reply, .-sd_ble_gatts_exchange_mtu_reply
	.section	.text.sd_ble_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_enable, %function
sd_ble_enable:
.LFB223:
	.file 6 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h"
	.loc 6 425 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 425 1
	.syntax unified
@ 425 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #96
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE223:
	.size	sd_ble_enable, .-sd_ble_enable
	.section	.text.sd_ble_cfg_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_cfg_set, %function
sd_ble_cfg_set:
.LFB224:
	.loc 6 461 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 461 1
	.syntax unified
@ 461 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #105
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE224:
	.size	sd_ble_cfg_set, .-sd_ble_cfg_set
	.section	.text.sd_ble_evt_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_evt_get, %function
sd_ble_evt_get:
.LFB225:
	.loc 6 499 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 499 1
	.syntax unified
@ 499 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #97
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE225:
	.size	sd_ble_evt_get, .-sd_ble_evt_get
	.section	.text.sd_ble_uuid_vs_add,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_uuid_vs_add, %function
sd_ble_uuid_vs_add:
.LFB226:
	.loc 6 528 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 528 1
	.syntax unified
@ 528 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #98
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE226:
	.size	sd_ble_uuid_vs_add, .-sd_ble_uuid_vs_add
	.section	.text.sd_ble_uuid_vs_remove,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_uuid_vs_remove, %function
sd_ble_uuid_vs_remove:
.LFB227:
	.loc 6 549 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 549 1
	.syntax unified
@ 549 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #106
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE227:
	.size	sd_ble_uuid_vs_remove, .-sd_ble_uuid_vs_remove
	.section	.text.sd_ble_uuid_decode,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_uuid_decode, %function
sd_ble_uuid_decode:
.LFB228:
	.loc 6 570 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 570 1
	.syntax unified
@ 570 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #99
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE228:
	.size	sd_ble_uuid_decode, .-sd_ble_uuid_decode
	.section	.text.sd_ble_uuid_encode,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_uuid_encode, %function
sd_ble_uuid_encode:
.LFB229:
	.loc 6 585 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 585 1
	.syntax unified
@ 585 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #100
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE229:
	.size	sd_ble_uuid_encode, .-sd_ble_uuid_encode
	.section	.text.sd_ble_version_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_version_get, %function
sd_ble_version_get:
.LFB230:
	.loc 6 598 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 598 1
	.syntax unified
@ 598 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #101
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE230:
	.size	sd_ble_version_get, .-sd_ble_version_get
	.section	.text.sd_ble_user_mem_reply,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_user_mem_reply, %function
sd_ble_user_mem_reply:
.LFB231:
	.loc 6 624 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 624 1
	.syntax unified
@ 624 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #102
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE231:
	.size	sd_ble_user_mem_reply, .-sd_ble_user_mem_reply
	.section	.text.sd_ble_opt_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_opt_set, %function
sd_ble_opt_set:
.LFB232:
	.loc 6 640 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 640 1
	.syntax unified
@ 640 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #103
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE232:
	.size	sd_ble_opt_set, .-sd_ble_opt_set
	.section	.text.sd_ble_opt_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_opt_get, %function
sd_ble_opt_get:
.LFB233:
	.loc 6 659 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 659 1
	.syntax unified
@ 659 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h" 1
	svc #104
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE233:
	.size	sd_ble_opt_get, .-sd_ble_opt_get
	.section	.text.sd_mutex_new,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_mutex_new, %function
sd_mutex_new:
.LFB234:
	.file 7 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h"
	.loc 7 431 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 431 1
	.syntax unified
@ 431 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #44
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE234:
	.size	sd_mutex_new, .-sd_mutex_new
	.section	.text.sd_mutex_acquire,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_mutex_acquire, %function
sd_mutex_acquire:
.LFB235:
	.loc 7 440 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 440 1
	.syntax unified
@ 440 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #45
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE235:
	.size	sd_mutex_acquire, .-sd_mutex_acquire
	.section	.text.sd_mutex_release,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_mutex_release, %function
sd_mutex_release:
.LFB236:
	.loc 7 448 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 448 1
	.syntax unified
@ 448 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #46
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE236:
	.size	sd_mutex_release, .-sd_mutex_release
	.section	.text.sd_rand_application_pool_capacity_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_rand_application_pool_capacity_get, %function
sd_rand_application_pool_capacity_get:
.LFB237:
	.loc 7 456 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 456 1
	.syntax unified
@ 456 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #47
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE237:
	.size	sd_rand_application_pool_capacity_get, .-sd_rand_application_pool_capacity_get
	.section	.text.sd_rand_application_bytes_available_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_rand_application_bytes_available_get, %function
sd_rand_application_bytes_available_get:
.LFB238:
	.loc 7 464 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 464 1
	.syntax unified
@ 464 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #48
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE238:
	.size	sd_rand_application_bytes_available_get, .-sd_rand_application_bytes_available_get
	.section	.text.sd_rand_application_vector_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_rand_application_vector_get, %function
sd_rand_application_vector_get:
.LFB239:
	.loc 7 474 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 474 1
	.syntax unified
@ 474 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #49
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE239:
	.size	sd_rand_application_vector_get, .-sd_rand_application_vector_get
	.section	.text.sd_power_reset_reason_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_reset_reason_get, %function
sd_power_reset_reason_get:
.LFB240:
	.loc 7 482 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 482 1
	.syntax unified
@ 482 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #52
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE240:
	.size	sd_power_reset_reason_get, .-sd_power_reset_reason_get
	.section	.text.sd_power_reset_reason_clr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_reset_reason_clr, %function
sd_power_reset_reason_clr:
.LFB241:
	.loc 7 490 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 490 1
	.syntax unified
@ 490 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #53
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE241:
	.size	sd_power_reset_reason_clr, .-sd_power_reset_reason_clr
	.section	.text.sd_power_mode_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_mode_set, %function
sd_power_mode_set:
.LFB242:
	.loc 7 499 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 499 1
	.syntax unified
@ 499 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #50
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE242:
	.size	sd_power_mode_set, .-sd_power_mode_set
	.section	.text.sd_power_system_off,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_system_off, %function
sd_power_system_off:
.LFB243:
	.loc 7 505 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 505 1
	.syntax unified
@ 505 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #51
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE243:
	.size	sd_power_system_off, .-sd_power_system_off
	.section	.text.sd_power_pof_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_pof_enable, %function
sd_power_pof_enable:
.LFB244:
	.loc 7 516 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 516 1
	.syntax unified
@ 516 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #54
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE244:
	.size	sd_power_pof_enable, .-sd_power_pof_enable
	.section	.text.sd_power_usbpwrrdy_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_usbpwrrdy_enable, %function
sd_power_usbpwrrdy_enable:
.LFB245:
	.loc 7 529 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 529 1
	.syntax unified
@ 529 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #77
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE245:
	.size	sd_power_usbpwrrdy_enable, .-sd_power_usbpwrrdy_enable
	.section	.text.sd_power_usbdetected_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_usbdetected_enable, %function
sd_power_usbdetected_enable:
.LFB246:
	.loc 7 542 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 542 1
	.syntax unified
@ 542 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #78
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE246:
	.size	sd_power_usbdetected_enable, .-sd_power_usbdetected_enable
	.section	.text.sd_power_usbremoved_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_usbremoved_enable, %function
sd_power_usbremoved_enable:
.LFB247:
	.loc 7 555 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 555 1
	.syntax unified
@ 555 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #79
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE247:
	.size	sd_power_usbremoved_enable, .-sd_power_usbremoved_enable
	.section	.text.sd_power_usbregstatus_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_usbregstatus_get, %function
sd_power_usbregstatus_get:
.LFB248:
	.loc 7 565 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 565 1
	.syntax unified
@ 565 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #80
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE248:
	.size	sd_power_usbregstatus_get, .-sd_power_usbregstatus_get
	.section	.text.sd_power_pof_threshold_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_pof_threshold_set, %function
sd_power_pof_threshold_set:
.LFB249:
	.loc 7 575 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 575 1
	.syntax unified
@ 575 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #55
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE249:
	.size	sd_power_pof_threshold_set, .-sd_power_pof_threshold_set
	.section	.text.sd_power_ram_power_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_ram_power_set, %function
sd_power_ram_power_set:
.LFB250:
	.loc 7 585 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 585 1
	.syntax unified
@ 585 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #57
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE250:
	.size	sd_power_ram_power_set, .-sd_power_ram_power_set
	.section	.text.sd_power_ram_power_clr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_ram_power_clr, %function
sd_power_ram_power_clr:
.LFB251:
	.loc 7 594 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 594 1
	.syntax unified
@ 594 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #58
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE251:
	.size	sd_power_ram_power_clr, .-sd_power_ram_power_clr
	.section	.text.sd_power_ram_power_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_ram_power_get, %function
sd_power_ram_power_get:
.LFB252:
	.loc 7 603 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 603 1
	.syntax unified
@ 603 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #59
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE252:
	.size	sd_power_ram_power_get, .-sd_power_ram_power_get
	.section	.text.sd_power_gpregret_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_gpregret_set, %function
sd_power_gpregret_set:
.LFB253:
	.loc 7 612 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 612 1
	.syntax unified
@ 612 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #60
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE253:
	.size	sd_power_gpregret_set, .-sd_power_gpregret_set
	.section	.text.sd_power_gpregret_clr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_gpregret_clr, %function
sd_power_gpregret_clr:
.LFB254:
	.loc 7 621 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 621 1
	.syntax unified
@ 621 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #61
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE254:
	.size	sd_power_gpregret_clr, .-sd_power_gpregret_clr
	.section	.text.sd_power_gpregret_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_gpregret_get, %function
sd_power_gpregret_get:
.LFB255:
	.loc 7 630 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 630 1
	.syntax unified
@ 630 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #62
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE255:
	.size	sd_power_gpregret_get, .-sd_power_gpregret_get
	.section	.text.sd_power_dcdc_mode_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_dcdc_mode_set, %function
sd_power_dcdc_mode_set:
.LFB256:
	.loc 7 639 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 639 1
	.syntax unified
@ 639 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #63
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE256:
	.size	sd_power_dcdc_mode_set, .-sd_power_dcdc_mode_set
	.section	.text.sd_clock_hfclk_request,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_clock_hfclk_request, %function
sd_clock_hfclk_request:
.LFB257:
	.loc 7 652 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 652 1
	.syntax unified
@ 652 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #66
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE257:
	.size	sd_clock_hfclk_request, .-sd_clock_hfclk_request
	.section	.text.sd_clock_hfclk_release,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_clock_hfclk_release, %function
sd_clock_hfclk_release:
.LFB258:
	.loc 7 663 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 663 1
	.syntax unified
@ 663 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #67
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE258:
	.size	sd_clock_hfclk_release, .-sd_clock_hfclk_release
	.section	.text.sd_clock_hfclk_is_running,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_clock_hfclk_is_running, %function
sd_clock_hfclk_is_running:
.LFB259:
	.loc 7 674 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 674 1
	.syntax unified
@ 674 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #68
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE259:
	.size	sd_clock_hfclk_is_running, .-sd_clock_hfclk_is_running
	.section	.text.sd_app_evt_wait,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_app_evt_wait, %function
sd_app_evt_wait:
.LFB260:
	.loc 7 702 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 702 1
	.syntax unified
@ 702 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #65
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE260:
	.size	sd_app_evt_wait, .-sd_app_evt_wait
	.section	.text.sd_ppi_channel_enable_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_channel_enable_get, %function
sd_ppi_channel_enable_get:
.LFB261:
	.loc 7 710 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 710 1
	.syntax unified
@ 710 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #32
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE261:
	.size	sd_ppi_channel_enable_get, .-sd_ppi_channel_enable_get
	.section	.text.sd_ppi_channel_enable_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_channel_enable_set, %function
sd_ppi_channel_enable_set:
.LFB262:
	.loc 7 718 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 718 1
	.syntax unified
@ 718 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #33
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE262:
	.size	sd_ppi_channel_enable_set, .-sd_ppi_channel_enable_set
	.section	.text.sd_ppi_channel_enable_clr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_channel_enable_clr, %function
sd_ppi_channel_enable_clr:
.LFB263:
	.loc 7 726 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 726 1
	.syntax unified
@ 726 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #34
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE263:
	.size	sd_ppi_channel_enable_clr, .-sd_ppi_channel_enable_clr
	.section	.text.sd_ppi_channel_assign,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_channel_assign, %function
sd_ppi_channel_assign:
.LFB264:
	.loc 7 737 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 737 1
	.syntax unified
@ 737 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #35
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE264:
	.size	sd_ppi_channel_assign, .-sd_ppi_channel_assign
	.section	.text.sd_ppi_group_task_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_group_task_enable, %function
sd_ppi_group_task_enable:
.LFB265:
	.loc 7 746 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 746 1
	.syntax unified
@ 746 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #36
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE265:
	.size	sd_ppi_group_task_enable, .-sd_ppi_group_task_enable
	.section	.text.sd_ppi_group_task_disable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_group_task_disable, %function
sd_ppi_group_task_disable:
.LFB266:
	.loc 7 755 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 755 1
	.syntax unified
@ 755 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #37
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE266:
	.size	sd_ppi_group_task_disable, .-sd_ppi_group_task_disable
	.section	.text.sd_ppi_group_assign,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_group_assign, %function
sd_ppi_group_assign:
.LFB267:
	.loc 7 765 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 765 1
	.syntax unified
@ 765 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #38
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE267:
	.size	sd_ppi_group_assign, .-sd_ppi_group_assign
	.section	.text.sd_ppi_group_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_group_get, %function
sd_ppi_group_get:
.LFB268:
	.loc 7 775 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 775 1
	.syntax unified
@ 775 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #39
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE268:
	.size	sd_ppi_group_get, .-sd_ppi_group_get
	.section	.text.sd_radio_notification_cfg_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_radio_notification_cfg_set, %function
sd_radio_notification_cfg_set:
.LFB269:
	.loc 7 806 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 806 1
	.syntax unified
@ 806 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #69
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE269:
	.size	sd_radio_notification_cfg_set, .-sd_radio_notification_cfg_set
	.section	.text.sd_ecb_block_encrypt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ecb_block_encrypt, %function
sd_ecb_block_encrypt:
.LFB270:
	.loc 7 822 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 822 1
	.syntax unified
@ 822 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #70
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE270:
	.size	sd_ecb_block_encrypt, .-sd_ecb_block_encrypt
	.section	.text.sd_ecb_blocks_encrypt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ecb_blocks_encrypt, %function
sd_ecb_blocks_encrypt:
.LFB271:
	.loc 7 839 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 839 1
	.syntax unified
@ 839 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #71
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE271:
	.size	sd_ecb_blocks_encrypt, .-sd_ecb_blocks_encrypt
	.section	.text.sd_evt_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_evt_get, %function
sd_evt_get:
.LFB272:
	.loc 7 850 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 850 1
	.syntax unified
@ 850 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #75
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE272:
	.size	sd_evt_get, .-sd_evt_get
	.section	.text.sd_temp_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_temp_get, %function
sd_temp_get:
.LFB273:
	.loc 7 861 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 861 1
	.syntax unified
@ 861 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #76
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE273:
	.size	sd_temp_get, .-sd_temp_get
	.section	.text.sd_flash_write,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_flash_write, %function
sd_flash_write:
.LFB274:
	.loc 7 898 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 898 1
	.syntax unified
@ 898 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #41
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE274:
	.size	sd_flash_write, .-sd_flash_write
	.section	.text.sd_flash_page_erase,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_flash_page_erase, %function
sd_flash_page_erase:
.LFB275:
	.loc 7 930 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 930 1
	.syntax unified
@ 930 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #40
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE275:
	.size	sd_flash_page_erase, .-sd_flash_page_erase
	.section	.text.sd_flash_protect,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_flash_protect, %function
sd_flash_protect:
.LFB276:
	.loc 7 953 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 953 1
	.syntax unified
@ 953 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #42
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE276:
	.size	sd_flash_protect, .-sd_flash_protect
	.section	.text.sd_radio_session_open,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_radio_session_open, %function
sd_radio_session_open:
.LFB277:
	.loc 7 975 2
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 975 2
	.syntax unified
@ 975 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #72
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE277:
	.size	sd_radio_session_open, .-sd_radio_session_open
	.section	.text.sd_radio_session_close,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_radio_session_close, %function
sd_radio_session_close:
.LFB278:
	.loc 7 988 2
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 988 2
	.syntax unified
@ 988 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #73
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE278:
	.size	sd_radio_session_close, .-sd_radio_session_close
	.section	.text.sd_radio_request,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_radio_request, %function
sd_radio_request:
.LFB279:
	.loc 7 1025 2
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 1025 2
	.syntax unified
@ 1025 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #74
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE279:
	.size	sd_radio_request, .-sd_radio_request
	.section	.text.sd_protected_register_write,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_protected_register_write, %function
sd_protected_register_write:
.LFB280:
	.loc 7 1046 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 1046 1
	.syntax unified
@ 1046 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h" 1
	svc #43
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	r0, r3
	.cfi_endproc
.LFE280:
	.size	sd_protected_register_write, .-sd_protected_register_write
	.section	.text.whitelist_has_entries,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	whitelist_has_entries, %function
whitelist_has_entries:
.LFB282:
	.loc 1 57 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp, #4]
	.loc 1 58 25
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #244]	@ zero_extendqisi2
	.loc 1 59 1
	mov	r0, r3
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE282:
	.size	whitelist_has_entries, .-whitelist_has_entries
	.section	.text.addr_is_valid,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	addr_is_valid, %function
addr_is_valid:
.LFB283:
	.loc 1 67 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
.LBB2:
	.loc 1 68 19
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 68 5
	b	.L121
.L124:
	.loc 1 70 19
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 70 12
	cmp	r3, #0
	beq	.L122
	.loc 1 72 20
	movs	r3, #1
	b	.L123
.L122:
	.loc 1 68 49 discriminator 2
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
.L121:
	.loc 1 68 28 discriminator 1
	ldr	r3, [sp, #12]
	cmp	r3, #5
	bls	.L124
.LBE2:
	.loc 1 75 12
	movs	r3, #0
.L123:
	.loc 1 76 1
	mov	r0, r3
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE283:
	.size	addr_is_valid, .-addr_is_valid
	.section	.text.adv_mode_next_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	adv_mode_next_get, %function
adv_mode_next_get:
.LFB284:
	.loc 1 84 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 85 39
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	adds	r2, r3, #1
	.loc 1 85 44
	ldr	r3, .L127
	smull	r1, r3, r3, r2
	asrs	r1, r3, #1
	asrs	r3, r2, #31
	subs	r1, r1, r3
	mov	r3, r1
	lsls	r3, r3, #2
	add	r3, r3, r1
	subs	r1, r2, r3
	.loc 1 85 12
	uxtb	r3, r1
	.loc 1 86 1
	mov	r0, r3
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L128:
	.align	2
.L127:
	.word	1717986919
	.cfi_endproc
.LFE284:
	.size	adv_mode_next_get, .-adv_mode_next_get
	.section	.text.on_connected,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	on_connected, %function
on_connected:
.LFB285:
	.loc 1 94 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 95 48
	ldr	r3, [sp]
	ldrb	r3, [r3, #15]	@ zero_extendqisi2
	.loc 1 95 8
	cmp	r3, #1
	bne	.L131
	.loc 1 97 79
	ldr	r3, [sp]
	ldrh	r2, [r3, #4]
	.loc 1 97 55
	ldr	r3, [sp, #4]
	strh	r2, [r3, #232]	@ movhi
.L131:
	.loc 1 99 1
	nop
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE285:
	.size	on_connected, .-on_connected
	.section	.text.on_disconnected,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	on_disconnected, %function
on_disconnected:
.LFB286:
	.loc 1 108 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 111 51
	ldr	r3, [sp, #4]
	movs	r2, #0
	strb	r2, [r3, #242]
	.loc 1 113 31
	ldr	r3, [sp]
	ldrh	r2, [r3, #4]
	.loc 1 113 60
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #232]
	.loc 1 113 8
	cmp	r2, r3
	bne	.L134
	.loc 1 114 40
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	.loc 1 114 72
	eor	r3, r3, #1
	uxtb	r3, r3
	.loc 1 113 93 discriminator 1
	cmp	r3, #0
	beq	.L134
	.loc 1 116 14
	movs	r1, #1
	ldr	r0, [sp, #4]
	bl	ble_advertising_start
	str	r0, [sp, #12]
	.loc 1 117 11
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L134
	.loc 1 117 50 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #56]
	.loc 1 117 33 discriminator 1
	cmp	r3, #0
	beq	.L134
	.loc 1 119 25
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #56]
	.loc 1 119 12
	ldr	r0, [sp, #12]
	blx	r3
.LVL0:
.L134:
	.loc 1 122 1
	nop
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE286:
	.size	on_disconnected, .-on_disconnected
	.section	.text.on_terminated,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	on_terminated, %function
on_terminated:
.LFB287:
	.loc 1 131 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 134 26
	ldr	r3, [sp]
	ldrh	r3, [r3]
	.loc 1 134 8
	cmp	r3, #38
	bne	.L139
	.loc 1 140 59
	ldr	r3, [sp]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	.loc 1 140 8
	cmp	r3, #1
	beq	.L138
	.loc 1 141 59
	ldr	r3, [sp]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	.loc 1 141 9
	cmp	r3, #2
	bne	.L135
.L138:
	.loc 1 144 15
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	mov	r0, r3
	bl	adv_mode_next_get
	mov	r3, r0
	.loc 1 144 15 is_stmt 0 discriminator 1
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	ble_advertising_start
	str	r0, [sp, #12]
	.loc 1 146 12 is_stmt 1
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L135
	.loc 1 146 51 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #56]
	.loc 1 146 34 discriminator 1
	cmp	r3, #0
	beq	.L135
	.loc 1 148 26
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #56]
	.loc 1 148 13
	ldr	r0, [sp, #12]
	blx	r3
.LVL1:
	b	.L135
.L139:
	.loc 1 137 9
	nop
.L135:
	.loc 1 151 1
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE287:
	.size	on_terminated, .-on_terminated
	.section	.text.adv_mode_next_avail_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	adv_mode_next_avail_get, %function
adv_mode_next_avail_get:
.LFB288:
	.loc 1 163 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 164 72
	ldr	r3, [sp, #4]
	adds	r3, r3, #235
	.loc 1 164 31
	mov	r0, r3
	bl	addr_is_valid
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 168 5
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	subs	r3, r3, #1
	cmp	r3, #3
	bhi	.L141
	adr	r2, .L143
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L143:
	.word	.L146+1
	.word	.L145+1
	.word	.L144+1
	.word	.L142+1
	.p2align 1
.L146:
	.loc 1 171 52
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 171 16
	cmp	r3, #0
	beq	.L145
	.loc 1 172 53
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	.loc 1 172 21
	eor	r3, r3, #1
	uxtb	r3, r3
	.loc 1 172 17
	cmp	r3, #0
	beq	.L145
	.loc 1 173 17
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L145
	.loc 1 175 24
	movs	r3, #1
	b	.L147
.L145:
	.loc 1 180 49
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	.loc 1 180 16
	cmp	r3, #0
	beq	.L144
	.loc 1 180 76 discriminator 1
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L144
	.loc 1 182 24
	movs	r3, #2
	b	.L147
.L144:
	.loc 1 187 48
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	.loc 1 187 16
	cmp	r3, #0
	beq	.L142
	.loc 1 189 24
	movs	r3, #3
	b	.L147
.L142:
	.loc 1 194 48
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	.loc 1 194 16
	cmp	r3, #0
	beq	.L141
	.loc 1 196 24
	movs	r3, #4
	b	.L147
.L141:
	.loc 1 201 20
	movs	r3, #0
.L147:
	.loc 1 203 1
	mov	r0, r3
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE288:
	.size	adv_mode_next_avail_get, .-adv_mode_next_avail_get
	.section	.text.set_adv_mode_directed_high_duty,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	set_adv_mode_directed_high_duty, %function
set_adv_mode_directed_high_duty:
.LFB289:
	.loc 1 215 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 216 31
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #49]
	.loc 1 217 31
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #228]
	.loc 1 219 37
	ldr	r3, [sp, #4]
	add	r2, r3, #234
	.loc 1 219 35
	ldr	r3, [sp]
	str	r2, [r3, #4]
	.loc 1 220 35
	ldr	r3, [sp]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 221 35
	ldr	r3, [sp]
	movs	r2, #2
	strb	r2, [r3]
	.loc 1 222 35
	ldr	r3, [sp]
	movs	r2, #128
	strh	r2, [r3, #12]	@ movhi
	.loc 1 224 12
	movs	r3, #0
	.loc 1 225 1
	mov	r0, r3
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE289:
	.size	set_adv_mode_directed_high_duty, .-set_adv_mode_directed_high_duty
	.section	.text.set_adv_mode_directed,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	set_adv_mode_directed, %function
set_adv_mode_directed:
.LFB290:
	.loc 1 237 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 238 28
	ldr	r3, [sp, #4]
	movs	r2, #2
	strb	r2, [r3, #49]
	.loc 1 247 39
	ldr	r3, [sp]
	movs	r2, #3
	strb	r2, [r3]
	.loc 1 251 61
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	.loc 1 251 28
	uxth	r2, r3
	ldr	r3, [sp]
	strh	r2, [r3, #12]	@ movhi
	.loc 1 253 31
	ldr	r3, [sp, #4]
	movs	r2, #0
	str	r2, [r3, #228]
	.loc 1 255 33
	ldr	r3, [sp, #4]
	add	r2, r3, #234
	.loc 1 255 31
	ldr	r3, [sp]
	str	r2, [r3, #4]
	.loc 1 256 64
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #12]
	.loc 1 256 31
	ldr	r3, [sp]
	str	r2, [r3, #8]
	.loc 1 258 12
	movs	r3, #0
	.loc 1 259 1
	mov	r0, r3
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE290:
	.size	set_adv_mode_directed, .-set_adv_mode_directed
	.section	.text.use_whitelist,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	use_whitelist, %function
use_whitelist:
.LFB291:
	.loc 1 269 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 270 44
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	.loc 1 271 61
	cmp	r3, #0
	beq	.L157
	.loc 1 271 27 discriminator 1
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #242]	@ zero_extendqisi2
	.loc 1 271 13 discriminator 1
	eor	r3, r3, #1
	uxtb	r3, r3
	.loc 1 270 72
	cmp	r3, #0
	beq	.L157
	.loc 1 272 13
	ldr	r0, [sp, #4]
	bl	whitelist_has_entries
	mov	r3, r0
	.loc 1 271 61 discriminator 4
	cmp	r3, #0
	beq	.L157
	.loc 1 271 61 is_stmt 0 discriminator 3
	movs	r3, #1
	.loc 1 271 61
	b	.L158
.L157:
	.loc 1 271 61 discriminator 2
	movs	r3, #0
.L158:
	.loc 1 271 61 discriminator 6
	and	r3, r3, #1
	uxtb	r3, r3
	.loc 1 273 1 is_stmt 1
	mov	r0, r3
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE291:
	.size	use_whitelist, .-use_whitelist
	.section	.text.flags_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	flags_set, %function
flags_set:
.LFB292:
	.loc 1 284 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 285 25
	ldr	r3, [sp, #4]
	ldr	r0, [r3, #212]
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #216]
	movs	r2, #1
	mov	r1, r3
	bl	ble_advdata_parse
	str	r0, [sp, #12]
	.loc 1 289 8
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L161
	.loc 1 291 18
	ldr	r3, [sp, #12]
	ldrb	r2, [sp, #3]
	strb	r2, [r3]
.L161:
	.loc 1 294 12
	ldr	r3, [sp, #4]
	add	r0, r3, #84
	.loc 1 294 69
	ldr	r3, [sp, #4]
	add	r1, r3, #212
	.loc 1 294 95
	ldr	r3, [sp, #4]
	adds	r3, r3, #60
	.loc 1 294 12
	mov	r2, r3
	bl	sd_ble_gap_adv_set_configure
	mov	r3, r0
	.loc 1 295 1
	mov	r0, r3
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE292:
	.size	flags_set, .-flags_set
	.section	.text.set_adv_mode_fast,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	set_adv_mode_fast, %function
set_adv_mode_fast:
.LFB293:
	.loc 1 307 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 310 61
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #20]
	.loc 1 310 28
	ldr	r3, [sp]
	str	r2, [r3, #8]
	.loc 1 311 61
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #24]
	.loc 1 311 28
	uxth	r2, r3
	ldr	r3, [sp]
	strh	r2, [r3, #12]	@ movhi
	.loc 1 321 51
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	.loc 1 326 9
	ldr	r0, [sp, #4]
	bl	use_whitelist
	mov	r3, r0
	.loc 1 326 8 discriminator 1
	cmp	r3, #0
	beq	.L164
	.loc 1 328 37
	ldr	r3, [sp]
	movs	r2, #2
	strb	r2, [r3, #20]
	.loc 1 331 15
	movs	r1, #4
	ldr	r0, [sp, #4]
	bl	flags_set
	str	r0, [sp, #12]
.LBB3:
	.loc 1 332 9
	ldr	r3, [sp, #12]
	str	r3, [sp, #8]
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L165
	.loc 1 332 9 is_stmt 0 discriminator 1
	ldr	r3, [sp, #8]
	.loc 1 332 9
	b	.L166
.L165:
.LBE3:
	.loc 1 334 32 is_stmt 1
	ldr	r3, [sp, #4]
	movs	r2, #5
	strb	r2, [r3, #49]
	b	.L167
.L164:
	.loc 1 338 32
	ldr	r3, [sp, #4]
	movs	r2, #3
	strb	r2, [r3, #49]
.L167:
	.loc 1 340 33
	ldr	r3, [sp, #4]
	add	r2, r3, #212
	.loc 1 340 31
	ldr	r3, [sp, #4]
	str	r2, [r3, #228]
	.loc 1 341 12
	movs	r3, #0
.L166:
	.loc 1 342 1
	mov	r0, r3
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE293:
	.size	set_adv_mode_fast, .-set_adv_mode_fast
	.section	.text.set_adv_mode_slow,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	set_adv_mode_slow, %function
set_adv_mode_slow:
.LFB294:
	.loc 1 354 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 357 61
	ldr	r3, [sp, #4]
	ldr	r2, [r3, #28]
	.loc 1 357 28
	ldr	r3, [sp]
	str	r2, [r3, #8]
	.loc 1 358 61
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #32]
	.loc 1 358 28
	uxth	r2, r3
	ldr	r3, [sp]
	strh	r2, [r3, #12]	@ movhi
	.loc 1 368 51
	ldr	r3, [sp, #4]
	movs	r2, #1
	strb	r2, [r3, #60]
	.loc 1 373 9
	ldr	r0, [sp, #4]
	bl	use_whitelist
	mov	r3, r0
	.loc 1 373 8 discriminator 1
	cmp	r3, #0
	beq	.L169
	.loc 1 375 37
	ldr	r3, [sp]
	movs	r2, #2
	strb	r2, [r3, #20]
	.loc 1 378 15
	movs	r1, #4
	ldr	r0, [sp, #4]
	bl	flags_set
	str	r0, [sp, #12]
.LBB4:
	.loc 1 379 9
	ldr	r3, [sp, #12]
	str	r3, [sp, #8]
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L170
	.loc 1 379 9 is_stmt 0 discriminator 1
	ldr	r3, [sp, #8]
	.loc 1 379 9
	b	.L171
.L170:
.LBE4:
	.loc 1 381 32 is_stmt 1
	ldr	r3, [sp, #4]
	movs	r2, #6
	strb	r2, [r3, #49]
	b	.L172
.L169:
	.loc 1 385 32
	ldr	r3, [sp, #4]
	movs	r2, #4
	strb	r2, [r3, #49]
.L172:
	.loc 1 387 33
	ldr	r3, [sp, #4]
	add	r2, r3, #212
	.loc 1 387 31
	ldr	r3, [sp, #4]
	str	r2, [r3, #228]
	.loc 1 388 12
	movs	r3, #0
.L171:
	.loc 1 389 1
	mov	r0, r3
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE294:
	.size	set_adv_mode_slow, .-set_adv_mode_slow
	.section	.text.config_is_valid,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	config_is_valid, %function
config_is_valid:
.LFB295:
	.loc 1 403 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp, #4]
	.loc 1 404 18
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #2]	@ zer