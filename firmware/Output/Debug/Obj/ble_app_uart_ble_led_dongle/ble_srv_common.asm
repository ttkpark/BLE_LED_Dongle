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
	.file	"ble_srv_common.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/ble/common/ble_srv_common.c"
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
	.section	.text.uint16_decode,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	uint16_decode, %function
uint16_decode:
.LFB152:
	.file 3 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/libraries/util/app_util.h"
	.loc 3 1115 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	str	r0, [sp, #4]
	.loc 3 1116 57
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sxth	r2, r3
	.loc 3 1117 57
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 3 1116 63
	sxth	r3, r3
	lsls	r3, r3, #8
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 3 1118 1
	mov	r0, r3
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE152:
	.size	uint16_decode, .-uint16_decode
	.section	.text.sd_ble_gap_addr_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ble_gap_addr_set, %function
sd_ble_gap_addr_set:
.LFB164:
	.file 4 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gap.h"
	.loc 4 1349 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1349 1
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
	.loc 4 1362 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1362 1
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
	.loc 4 1381 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1381 1
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
	.loc 4 1402 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1402 1
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
	.loc 4 1430 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1430 1
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
	.loc 4 1452 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1452 1
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
	.loc 4 1466 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1466 1
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
	.loc 4 1512 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1512 1
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
	.loc 4 1561 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1561 1
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
	.loc 4 1576 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1576 1
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
	.loc 4 1606 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1606 1
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
	.loc 4 1630 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1630 1
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
	.loc 4 1657 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1657 1
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
	.loc 4 1667 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1667 1
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
	.loc 4 1677 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1677 1
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
	.loc 4 1690 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1690 1
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
	.loc 4 1702 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1702 1
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
	.loc 4 1720 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1720 1
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
	.loc 4 1737 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1737 1
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
	.loc 4 1774 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1774 1
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
	.loc 4 1823 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1823 1
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
	.loc 4 1854 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1854 1
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
	.loc 4 1885 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1885 1
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
	.loc 4 1906 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1906 1
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
	.loc 4 1926 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1926 1
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
	.loc 4 1956 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1956 1
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
	.loc 4 1982 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1982 1
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
	.loc 4 1994 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 1994 1
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
	.loc 4 2020 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 2020 1
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
	.loc 4 2039 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 2039 1
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
	.loc 4 2061 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 2061 1
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
	.loc 4 2112 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 2112 1
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
	.loc 4 2138 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 4 2138 1
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
	.file 5 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gattc.h"
	.loc 5 419 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 419 1
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
	.loc 5 447 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 447 1
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
	.loc 5 474 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 474 1
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
	.loc 5 501 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 501 1
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
	.loc 5 528 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 528 1
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
	.loc 5 555 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 555 1
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
	.loc 5 581 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 581 1
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
	.loc 5 628 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 628 1
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
	.loc 5 646 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 646 1
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
	.loc 5 664 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 664 1
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
	.loc 5 697 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 5 697 1
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
	.file 6 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble_gatts.h"
	.loc 6 446 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 446 1
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
	.loc 6 472 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 472 1
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
	.loc 6 501 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 501 1
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
	.loc 6 524 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 524 1
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
	.loc 6 547 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 547 1
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
	.loc 6 571 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 571 1
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
	.loc 6 636 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 636 1
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
	.loc 6 672 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 672 1
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
	.loc 6 705 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 705 1
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
	.loc 6 749 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 749 1
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
	.loc 6 782 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 782 1
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
	.loc 6 792 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 792 1
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
	.loc 6 805 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 805 1
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
	.loc 6 835 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 6 835 1
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
	.file 7 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/ble.h"
	.loc 7 425 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 425 1
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
	.loc 7 461 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 461 1
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
	.loc 7 499 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 499 1
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
	.loc 7 528 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 528 1
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
	.loc 7 549 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 549 1
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
	.loc 7 570 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 570 1
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
	.loc 7 585 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 585 1
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
	.loc 7 598 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 598 1
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
	.loc 7 624 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 624 1
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
	.loc 7 640 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 640 1
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
	.loc 7 659 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 7 659 1
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
	.section	.text.ble_srv_is_notification_enabled,"ax",%progbits
	.align	1
	.global	ble_srv_is_notification_enabled
	.syntax unified
	.thumb
	.thumb_func
	.type	ble_srv_is_notification_enabled, %function
ble_srv_is_notification_enabled:
.LFB234:
	.loc 1 52 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	str	r0, [sp, #4]
	.loc 1 53 27
	ldr	r0, [sp, #4]
	bl	uint16_decode
	mov	r3, r0
	strh	r3, [sp, #14]	@ movhi
	.loc 1 54 54
	ldrh	r3, [sp, #14]	@ movhi
	and	r3, r3, #1
	uxtb	r3, r3
	.loc 1 55 1
	mov	r0, r3
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE234:
	.size	ble_srv_is_notification_enabled, .-ble_srv_is_notification_enabled
	.section	.text.ble_srv_is_indication_enabled,"ax",%progbits
	.align	1
	.global	ble_srv_is_indication_enabled
	.syntax unified
	.thumb
	.thumb_func
	.type	ble_srv_is_indication_enabled, %function
ble_srv_is_indication_enabled:
.LFB235:
	.loc 1 58 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	str	r0, [sp, #4]
	.loc 1 59 27
	ldr	r0, [sp, #4]
	bl	uint16_decode
	mov	r3, r0
	strh	r3, [sp, #14]	@ movhi
	.loc 1 60 25
	ldrh	r3, [sp, #14]
	and	r3, r3, #2
	.loc 1 60 52
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	.loc 1 61 1
	mov	r0, r3
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE235:
	.size	ble_srv_is_indication_enabled, .-ble_srv_is_indication_enabled
	.section .rodata
	.align	2
.LC0:
	.ascii	"C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/ble/"
	.ascii	"common/ble_srv_common.c\000"
	.section	.text.ble_srv_report_ref_encode,"ax",%progbits
	.align	1
	.global	ble_srv_report_ref_encode
	.syntax unified
	.thumb
	.thumb_func
	.type	ble_srv_report_ref_encode, %function
ble_srv_report_ref_encode:
.LFB236:
	.loc 1 65 1
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
	.loc 1 66 13
	movs	r3, #0
	strb	r3, [sp, #15]
	.loc 1 68 25
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	adds	r2, r3, #1
	strb	r2, [sp, #15]
	mov	r2, r3
	.loc 1 68 21
	ldr	r3, [sp, #4]
	add	r3, r3, r2
	.loc 1 68 43
	ldr	r2, [sp]
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 68 29
	strb	r2, [r3]
	.loc 1 69 25
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	adds	r2, r3, #1
	strb	r2, [sp, #15]
	mov	r2, r3
	.loc 1 69 21
	ldr	r3, [sp, #4]
	add	r3, r3, r2
	.loc 1 69 43
	ldr	r2, [sp]
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	.loc 1 69 29
	strb	r2, [r3]
.LBB2:
	.loc 1 71 5
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #2
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [sp, #8]
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L78
	.loc 1 71 5 is_stmt 0 discriminator 1
	ldr	r2, .L80
	movs	r1, #71
	movs	r0, #0
	bl	app_error_handler
.L78:
.LBE2:
	.loc 1 72 12 is_stmt 1
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 73 1
	mov	r0, r3
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L81:
	.align	2
.L80:
	.word	.LC0
	.cfi_endproc
.LFE236:
	.size	ble_srv_report_ref_encode, .-ble_srv_report_ref_encode
	.section	.text.ble_srv_ascii_to_utf8,"ax",%progbits
	.align	1
	.global	ble_srv_ascii_to_utf8
	.syntax unified
	.thumb
	.thumb_func
	.type	ble_srv_ascii_to_utf8, %function
ble_srv_ascii_to_utf8:
.LFB237:
	.loc 1 77 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 78 32
	ldr	r0, [sp]
	bl	strlen
	mov	r3, r0
	.loc 1 78 22 discriminator 1
	uxth	r2, r3
	.loc 1 78 20 discriminator 1
	ldr	r3, [sp, #4]
	strh	r2, [r3]	@ movhi
	.loc 1 79 20
	ldr	r3, [sp, #4]
	ldr	r2, [sp]
	str	r2, [r3, #4]
	.loc 1 80 1
	nop
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE237:
	.size	ble_srv_ascii_to_utf8, .-ble_srv_ascii_to_utf8
	.section	.text.set_security_req,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	set_security_req, %function
set_security_req:
.LFB238:
	.loc 1 91 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	mov	r3, r0
	str	r1, [sp]
	strb	r3, [sp, #7]
	.loc 1 94 5
	ldr	r2, [sp]
	ldrb	r3, [r2]
	bic	r3, r3, #15
	strb	r3, [r2]
	ldr	r2, [sp]
	ldrb	r3, [r2]
	bic	r3, r3, #240
	strb	r3, [r2]
	.loc 1 95 5
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #5
	bhi	.L93
	adr	r2, .L86
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L86:
	.word	.L91+1
	.word	.L90+1
	.word	.L89+1
	.word	.L88+1
	.word	.L87+1
	.word	.L85+1
	.p2align 1
.L91:
	.loc 1 98 13
	ldr	r2, [sp]
	ldrb	r3, [r2]
	bic	r3, r3, #15
	strb	r3, [r2]
	ldr	r2, [sp]
	ldrb	r3, [r2]
	bic	r3, r3, #240
	strb	r3, [r2]
	.loc 1 99 9
	b	.L84
.L90:
	.loc 1 101 13
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #1
	bfi	r3, r1, #0, #4
	strb	r3, [r2]
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #1
	bfi	r3, r1, #4, #4
	strb	r3, [r2]
	.loc 1 102 9
	b	.L84
.L89:
	.loc 1 104 13
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #1
	bfi	r3, r1, #0, #4
	strb	r3, [r2]
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #2
	bfi	r3, r1, #4, #4
	strb	r3, [r2]
	.loc 1 105 9
	b	.L84
.L88:
	.loc 1 107 13
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #1
	bfi	r3, r1, #0, #4
	strb	r3, [r2]
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #3
	bfi	r3, r1, #4, #4
	strb	r3, [r2]
	.loc 1 108 9
	b	.L84
.L87:
	.loc 1 110 13
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #2
	bfi	r3, r1, #0, #4
	strb	r3, [r2]
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #1
	bfi	r3, r1, #4, #4
	strb	r3, [r2]
	.loc 1 111 9
	b	.L84
.L85:
	.loc 1 113 13
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #2
	bfi	r3, r1, #0, #4
	strb	r3, [r2]
	ldr	r2, [sp]
	ldrb	r3, [r2]
	movs	r1, #2
	bfi	r3, r1, #4, #4
	strb	r3, [r2]
	.loc 1 114 9
	nop
.L84:
	.loc 1 116 5
	nop
.L93:
	nop
	.loc 1 117 1
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE238:
	.size	set_security_req, .-set_security_req
	.section	.text.characteristic_add,"ax",%progbits
	.align	1
	.global	characteristic_add
	.syntax unified
	.thumb
	.thumb_func
	.type	characteristic_add, %function
characteristic_add:
.LFB239:
	.loc 1 123 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #84
	.cfi_def_cfa_offset 88
	mov	r3, r0
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	strh	r3, [sp, #14]	@ movhi
	.loc 1 131 21
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 131 8
	cmp	r3, #0
	bne	.L96
	.loc 1 133 24
	movs	r3, #1
	strb	r3, [sp, #30]
	b	.L97
.L96:
	.loc 1 137 38
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 137 24
	strb	r3, [sp, #30]
.L97:
	.loc 1 139 34
	ldr	r3, [sp, #8]
	ldrh	r3, [r3]
	.loc 1 139 20
	strh	r3, [sp, #28]	@ movhi
	.loc 1 141 5
	add	r3, sp, #24
	movs	r2, #3
	movs	r1, #0
	mov	r0, r3
	bl	memset
	.loc 1 142 5
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #17]	@ zero_extendqisi2
	add	r2, sp, #24
	mov	r1, r2
	mov	r0, r3
	bl	set_security_req
	.loc 1 143 5
	ldr	r3, [sp, #8]
	ldrb	r2, [r3, #18]	@ zero_extendqisi2
	add	r3, sp, #24
	adds	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	set_security_req
	.loc 1 144 39
	ldr	r3, [sp, #8]
	ldrb	r2, [r3, #15]	@ zero_extendqisi2
	.loc 1 144 24
	ldrb	r3, [sp, #26]
	bfi	r3, r2, #3, #1
	strb	r3, [sp, #26]
	.loc 1 145 39
	ldr	r3, [sp, #8]
	ldrb	r2, [r3, #16]	@ zero_extendqisi2
	.loc 1 145 24
	ldrb	r3, [sp, #26]
	bfi	r3, r2, #4, #1
	strb	r3, [sp, #26]
	.loc 1 146 39
	ldr	r3, [sp, #8]
	ldrb	r2, [r3, #12]	@ zero_extendqisi2
	.loc 1 146 24
	ldrb	r3, [sp, #26]
	bfi	r3, r2, #0, #1
	strb	r3, [sp, #26]
	.loc 1 147 39
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #20]	@ zero_extendqisi2
	.loc 1 147 77
	cmp	r3, #0
	beq	.L98
	.loc 1 147 77 is_stmt 0 discriminator 1
	movs	r2, #2
	b	.L99
.L98:
	.loc 1 147 77 discriminator 2
	movs	r2, #1
.L99:
	.loc 1 147 24 is_stmt 1 discriminator 4
	ldrb	r3, [sp, #26]
	bfi	r3, r2, #1, #2
	strb	r3, [sp, #26]
	.loc 1 150 5
	add	r3, sp, #52
	movs	r2, #28
	movs	r1, #0
	mov	r0, r3
	bl	memset
	.loc 1 151 42
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	and	r3, r3, #16
	uxtb	r3, r3
	.loc 1 151 8
	cmp	r3, #0
	bne	.L100
	.loc 1 151 84 discriminator 1
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	and	r3, r3, #32
	uxtb	r3, r3
	.loc 1 151 47 discriminator 1
	cmp	r3, #0
	beq	.L101
.L100:
	.loc 1 154 9
	add	r3, sp, #16
	movs	r2, #3
	movs	r1, #0
	mov	r0, r3
	bl	memset
	.loc 1 155 9
	ldr	r3, [sp, #8]
	ldrb	r2, [r3, #19]	@ zero_extendqisi2
	add	r3, sp, #16
	adds	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	set_security_req
	.loc 1 156 9
	ldrb	r3, [sp, #16]
	movs	r2, #1
	bfi	r3, r2, #0, #4
	strb	r3, [sp, #16]
	ldrb	r3, [sp, #16]
	movs	r2, #1
	bfi	r3, r2, #4, #4
	strb	r3, [sp, #16]
	.loc 1 158 28
	ldrb	r3, [sp, #18]
	movs	r2, #1
	bfi	r3, r2, #1, #2
	strb	r3, [sp, #18]
	.loc 1 160 28
	add	r3, sp, #16
	str	r3, [sp, #72]
.L101:
	.loc 1 162 28
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #13]
	strb	r3, [sp, #52]
	.loc 1 163 28
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #14]
	strb	r3, [sp, #53]
	.loc 1 165 5
	add	r3, sp, #32
	movs	r2, #20
	movs	r1, #0
	mov	r0, r3
	bl	memset
	.loc 1 166 31
	add	r3, sp, #28
	str	r3, [sp, #32]
	.loc 1 167 31
	add	r3, sp, #24
	str	r3, [sp, #36]
	.loc 1 168 45
	ldr	r3, [sp, #8]
	ldrh	r3, [r3, #4]
	.loc 1 168 31
	strh	r3, [sp, #44]	@ movhi
	.loc 1 169 21
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #8]
	.loc 1 169 8
	cmp	r3, #0
	beq	.L102
	.loc 1 171 49
	ldr	r3, [sp, #8]
	ldrh	r3, [r3, #6]
	.loc 1 171 35
	strh	r3, [sp, #40]	@ movhi
	.loc 1 172 49
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #8]
	.loc 1 172 35
	str	r3, [sp, #48]
.L102:
	.loc 1 174 21
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 174 8
	cmp	r3, #0
	beq	.L103
	.loc 1 176 9
	add	r3, sp, #20
	movs	r2, #3
	movs	r1, #0
	mov	r0, r3
	bl	memset
	.loc 1 177 55
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 177 69
	ldrh	r3, [r3]
	.loc 1 177 41
	strh	r3, [sp, #60]	@ movhi
	.loc 1 178 55
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 178 69
	ldrh	r3, [r3, #2]
	.loc 1 178 41
	strh	r3, [sp, #62]	@ movhi
	.loc 1 179 55
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 179 69
	ldr	r3, [r3, #4]
	.loc 1 179 41
	str	r3, [sp, #56]
	.loc 1 181 41
	add	r3, sp, #20
	str	r3, [sp, #68]
	.loc 1 183 38
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 183 9
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	add	r2, sp, #20
	mov	r1, r2
	mov	r0, r3
	bl	set_security_req
	.loc 1 184 38
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 184 9
	ldrb	r2, [r3, #13]	@ zero_extendqisi2
	add	r3, sp, #20
	adds	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	set_security_req
	.loc 1 186 56
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 186 70
	ldrb	r2, [r3, #10]	@ zero_extendqisi2
	.loc 1 186 41
	ldrb	r3, [sp, #22]
	bfi	r3, r2, #3, #1
	strb	r3, [sp, #22]
	.loc 1 187 56
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 187 70
	ldrb	r2, [r3, #11]	@ zero_extendqisi2
	.loc 1 187 41
	ldrb	r3, [sp, #22]
	bfi	r3, r2, #4, #1
	strb	r3, [sp, #22]
	.loc 1 188 56
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #24]
	.loc 1 188 70
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	.loc 1 188