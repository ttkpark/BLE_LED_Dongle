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
	.file	"bsp.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/libraries/bsp/bsp.c"
	.section	.text.sd_mbr_command,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_mbr_command, %function
sd_mbr_command:
.LFB150:
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
.LFE150:
	.size	sd_mbr_command, .-sd_mbr_command
	.section	.text.sd_mutex_new,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_mutex_new, %function
sd_mutex_new:
.LFB176:
	.file 3 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/components/softdevice/s112/headers/nrf_soc.h"
	.loc 3 431 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 431 1
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
.LFE176:
	.size	sd_mutex_new, .-sd_mutex_new
	.section	.text.sd_mutex_acquire,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_mutex_acquire, %function
sd_mutex_acquire:
.LFB177:
	.loc 3 440 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 440 1
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
.LFE177:
	.size	sd_mutex_acquire, .-sd_mutex_acquire
	.section	.text.sd_mutex_release,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_mutex_release, %function
sd_mutex_release:
.LFB178:
	.loc 3 448 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 448 1
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
.LFE178:
	.size	sd_mutex_release, .-sd_mutex_release
	.section	.text.sd_rand_application_pool_capacity_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_rand_application_pool_capacity_get, %function
sd_rand_application_pool_capacity_get:
.LFB179:
	.loc 3 456 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 456 1
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
.LFE179:
	.size	sd_rand_application_pool_capacity_get, .-sd_rand_application_pool_capacity_get
	.section	.text.sd_rand_application_bytes_available_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_rand_application_bytes_available_get, %function
sd_rand_application_bytes_available_get:
.LFB180:
	.loc 3 464 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 464 1
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
.LFE180:
	.size	sd_rand_application_bytes_available_get, .-sd_rand_application_bytes_available_get
	.section	.text.sd_rand_application_vector_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_rand_application_vector_get, %function
sd_rand_application_vector_get:
.LFB181:
	.loc 3 474 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 474 1
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
.LFE181:
	.size	sd_rand_application_vector_get, .-sd_rand_application_vector_get
	.section	.text.sd_power_reset_reason_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_reset_reason_get, %function
sd_power_reset_reason_get:
.LFB182:
	.loc 3 482 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 482 1
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
.LFE182:
	.size	sd_power_reset_reason_get, .-sd_power_reset_reason_get
	.section	.text.sd_power_reset_reason_clr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_reset_reason_clr, %function
sd_power_reset_reason_clr:
.LFB183:
	.loc 3 490 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 490 1
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
.LFE183:
	.size	sd_power_reset_reason_clr, .-sd_power_reset_reason_clr
	.section	.text.sd_power_mode_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_mode_set, %function
sd_power_mode_set:
.LFB184:
	.loc 3 499 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 499 1
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
.LFE184:
	.size	sd_power_mode_set, .-sd_power_mode_set
	.section	.text.sd_power_system_off,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_system_off, %function
sd_power_system_off:
.LFB185:
	.loc 3 505 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 505 1
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
.LFE185:
	.size	sd_power_system_off, .-sd_power_system_off
	.section	.text.sd_power_pof_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_pof_enable, %function
sd_power_pof_enable:
.LFB186:
	.loc 3 516 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 516 1
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
.LFE186:
	.size	sd_power_pof_enable, .-sd_power_pof_enable
	.section	.text.sd_power_usbpwrrdy_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_usbpwrrdy_enable, %function
sd_power_usbpwrrdy_enable:
.LFB187:
	.loc 3 529 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 529 1
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
.LFE187:
	.size	sd_power_usbpwrrdy_enable, .-sd_power_usbpwrrdy_enable
	.section	.text.sd_power_usbdetected_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_usbdetected_enable, %function
sd_power_usbdetected_enable:
.LFB188:
	.loc 3 542 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 542 1
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
.LFE188:
	.size	sd_power_usbdetected_enable, .-sd_power_usbdetected_enable
	.section	.text.sd_power_usbremoved_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_usbremoved_enable, %function
sd_power_usbremoved_enable:
.LFB189:
	.loc 3 555 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 555 1
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
.LFE189:
	.size	sd_power_usbremoved_enable, .-sd_power_usbremoved_enable
	.section	.text.sd_power_usbregstatus_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_usbregstatus_get, %function
sd_power_usbregstatus_get:
.LFB190:
	.loc 3 565 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 565 1
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
.LFE190:
	.size	sd_power_usbregstatus_get, .-sd_power_usbregstatus_get
	.section	.text.sd_power_pof_threshold_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_pof_threshold_set, %function
sd_power_pof_threshold_set:
.LFB191:
	.loc 3 575 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 575 1
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
.LFE191:
	.size	sd_power_pof_threshold_set, .-sd_power_pof_threshold_set
	.section	.text.sd_power_ram_power_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_ram_power_set, %function
sd_power_ram_power_set:
.LFB192:
	.loc 3 585 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 585 1
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
.LFE192:
	.size	sd_power_ram_power_set, .-sd_power_ram_power_set
	.section	.text.sd_power_ram_power_clr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_ram_power_clr, %function
sd_power_ram_power_clr:
.LFB193:
	.loc 3 594 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 594 1
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
.LFE193:
	.size	sd_power_ram_power_clr, .-sd_power_ram_power_clr
	.section	.text.sd_power_ram_power_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_ram_power_get, %function
sd_power_ram_power_get:
.LFB194:
	.loc 3 603 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 603 1
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
.LFE194:
	.size	sd_power_ram_power_get, .-sd_power_ram_power_get
	.section	.text.sd_power_gpregret_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_gpregret_set, %function
sd_power_gpregret_set:
.LFB195:
	.loc 3 612 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 612 1
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
.LFE195:
	.size	sd_power_gpregret_set, .-sd_power_gpregret_set
	.section	.text.sd_power_gpregret_clr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_gpregret_clr, %function
sd_power_gpregret_clr:
.LFB196:
	.loc 3 621 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 621 1
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
.LFE196:
	.size	sd_power_gpregret_clr, .-sd_power_gpregret_clr
	.section	.text.sd_power_gpregret_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_gpregret_get, %function
sd_power_gpregret_get:
.LFB197:
	.loc 3 630 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 630 1
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
.LFE197:
	.size	sd_power_gpregret_get, .-sd_power_gpregret_get
	.section	.text.sd_power_dcdc_mode_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_power_dcdc_mode_set, %function
sd_power_dcdc_mode_set:
.LFB198:
	.loc 3 639 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 639 1
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
.LFE198:
	.size	sd_power_dcdc_mode_set, .-sd_power_dcdc_mode_set
	.section	.text.sd_clock_hfclk_request,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_clock_hfclk_request, %function
sd_clock_hfclk_request:
.LFB199:
	.loc 3 652 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 652 1
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
.LFE199:
	.size	sd_clock_hfclk_request, .-sd_clock_hfclk_request
	.section	.text.sd_clock_hfclk_release,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_clock_hfclk_release, %function
sd_clock_hfclk_release:
.LFB200:
	.loc 3 663 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 663 1
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
.LFE200:
	.size	sd_clock_hfclk_release, .-sd_clock_hfclk_release
	.section	.text.sd_clock_hfclk_is_running,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_clock_hfclk_is_running, %function
sd_clock_hfclk_is_running:
.LFB201:
	.loc 3 674 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 674 1
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
.LFE201:
	.size	sd_clock_hfclk_is_running, .-sd_clock_hfclk_is_running
	.section	.text.sd_app_evt_wait,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_app_evt_wait, %function
sd_app_evt_wait:
.LFB202:
	.loc 3 702 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 702 1
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
.LFE202:
	.size	sd_app_evt_wait, .-sd_app_evt_wait
	.section	.text.sd_ppi_channel_enable_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_channel_enable_get, %function
sd_ppi_channel_enable_get:
.LFB203:
	.loc 3 710 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 710 1
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
.LFE203:
	.size	sd_ppi_channel_enable_get, .-sd_ppi_channel_enable_get
	.section	.text.sd_ppi_channel_enable_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_channel_enable_set, %function
sd_ppi_channel_enable_set:
.LFB204:
	.loc 3 718 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 718 1
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
.LFE204:
	.size	sd_ppi_channel_enable_set, .-sd_ppi_channel_enable_set
	.section	.text.sd_ppi_channel_enable_clr,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_channel_enable_clr, %function
sd_ppi_channel_enable_clr:
.LFB205:
	.loc 3 726 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 726 1
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
.LFE205:
	.size	sd_ppi_channel_enable_clr, .-sd_ppi_channel_enable_clr
	.section	.text.sd_ppi_channel_assign,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_channel_assign, %function
sd_ppi_channel_assign:
.LFB206:
	.loc 3 737 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 737 1
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
.LFE206:
	.size	sd_ppi_channel_assign, .-sd_ppi_channel_assign
	.section	.text.sd_ppi_group_task_enable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_group_task_enable, %function
sd_ppi_group_task_enable:
.LFB207:
	.loc 3 746 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 746 1
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
.LFE207:
	.size	sd_ppi_group_task_enable, .-sd_ppi_group_task_enable
	.section	.text.sd_ppi_group_task_disable,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_group_task_disable, %function
sd_ppi_group_task_disable:
.LFB208:
	.loc 3 755 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 755 1
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
.LFE208:
	.size	sd_ppi_group_task_disable, .-sd_ppi_group_task_disable
	.section	.text.sd_ppi_group_assign,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_group_assign, %function
sd_ppi_group_assign:
.LFB209:
	.loc 3 765 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 765 1
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
.LFE209:
	.size	sd_ppi_group_assign, .-sd_ppi_group_assign
	.section	.text.sd_ppi_group_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ppi_group_get, %function
sd_ppi_group_get:
.LFB210:
	.loc 3 775 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 775 1
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
.LFE210:
	.size	sd_ppi_group_get, .-sd_ppi_group_get
	.section	.text.sd_radio_notification_cfg_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_radio_notification_cfg_set, %function
sd_radio_notification_cfg_set:
.LFB211:
	.loc 3 806 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 806 1
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
.LFE211:
	.size	sd_radio_notification_cfg_set, .-sd_radio_notification_cfg_set
	.section	.text.sd_ecb_block_encrypt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ecb_block_encrypt, %function
sd_ecb_block_encrypt:
.LFB212:
	.loc 3 822 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 822 1
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
.LFE212:
	.size	sd_ecb_block_encrypt, .-sd_ecb_block_encrypt
	.section	.text.sd_ecb_blocks_encrypt,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_ecb_blocks_encrypt, %function
sd_ecb_blocks_encrypt:
.LFB213:
	.loc 3 839 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 839 1
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
.LFE213:
	.size	sd_ecb_blocks_encrypt, .-sd_ecb_blocks_encrypt
	.section	.text.sd_evt_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_evt_get, %function
sd_evt_get:
.LFB214:
	.loc 3 850 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 850 1
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
.LFE214:
	.size	sd_evt_get, .-sd_evt_get
	.section	.text.sd_temp_get,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_temp_get, %function
sd_temp_get:
.LFB215:
	.loc 3 861 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 861 1
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
.LFE215:
	.size	sd_temp_get, .-sd_temp_get
	.section	.text.sd_flash_write,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_flash_write, %function
sd_flash_write:
.LFB216:
	.loc 3 898 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 898 1
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
.LFE216:
	.size	sd_flash_write, .-sd_flash_write
	.section	.text.sd_flash_page_erase,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_flash_page_erase, %function
sd_flash_page_erase:
.LFB217:
	.loc 3 930 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 930 1
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
.LFE217:
	.size	sd_flash_page_erase, .-sd_flash_page_erase
	.section	.text.sd_flash_protect,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_flash_protect, %function
sd_flash_protect:
.LFB218:
	.loc 3 953 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 953 1
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
.LFE218:
	.size	sd_flash_protect, .-sd_flash_protect
	.section	.text.sd_radio_session_open,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_radio_session_open, %function
sd_radio_session_open:
.LFB219:
	.loc 3 975 2
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 975 2
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
.LFE219:
	.size	sd_radio_session_open, .-sd_radio_session_open
	.section	.text.sd_radio_session_close,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_radio_session_close, %function
sd_radio_session_close:
.LFB220:
	.loc 3 988 2
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 988 2
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
.LFE220:
	.size	sd_radio_session_close, .-sd_radio_session_close
	.section	.text.sd_radio_request,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_radio_request, %function
sd_radio_request:
.LFB221:
	.loc 3 1025 2
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1025 2
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
.LFE221:
	.size	sd_radio_request, .-sd_radio_request
	.section	.text.sd_protected_register_write,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	sd_protected_register_write, %function
sd_protected_register_write:
.LFB222:
	.loc 3 1046 1
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 3 1046 1
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
.LFE222:
	.size	sd_protected_register_write, .-sd_protected_register_write
	.section .rodata
	.align	2
.LC0:
	.ascii	"C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/modules/nrfx/ha"
	.ascii	"l/nrf_gpio.h\000"
	.section	.text.nrf_gpio_pin_port_decode,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_gpio_pin_port_decode, %function
nrf_gpio_pin_port_decode:
.LFB238:
	.file 4 "C:/nrf5_sdk/nRF5_SDK_17.1.0_ddde560/modules/nrfx/hal/nrf_gpio.h"
	.loc 4 491 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 4 492 5 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	mov	r0, r3
	bl	nrf_gpio_pin_present_check
	mov	r3, r0
	cmp	r3, #0
	bne	.L50
	.loc 4 492 5 is_stmt 0 discriminator 2
	ldr	r1, .L52
	mov	r0, #492
	bl	assert_nrf_callback
.L50:
	.loc 4 494 12 is_stmt 1
	mov	r3, #1342177280
	.loc 4 506 1
	mov	r0, r3
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L53:
	.align	2
.L52:
	.word	.LC0
	.cfi_endproc
.LFE238:
	.size	nrf_gpio_pin_port_decode, .-nrf_gpio_pin_port_decode
	.section	.text.nrf_gpio_cfg_sense_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_gpio_cfg_sense_set, %function
nrf_gpio_cfg_sense_set:
.LFB248:
	.loc 4 620 1
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
	.loc 4 621 27
	add	r3, sp, #4
	mov	r0, r3
	bl	nrf_gpio_pin_port_decode
	str	r0, [sp, #12]
	.loc 4 624 17
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #12]
	add	r2, r2, #448
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [sp, #4]
	.loc 4 624 30
	bic	r1, r3, #196608
	ldr	r3, [sp, #12]
	add	r2, r2, #448
	str	r1, [r3, r2, lsl #2]
	.loc 4 625 17
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #12]
	add	r2, r2, #448
	ldr	r1, [r3, r2, lsl #2]
	.loc 4 625 47
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	lsls	r3, r3, #16
	.loc 4 625 17
	ldr	r2, [sp, #4]
	.loc 4 625 30
	orrs	r1, r1, r3
	ldr	r3, [sp, #12]
	add	r2, r2, #448
	str	r1, [r3, r2, lsl #2]
	.loc 4 626 1
	nop
	add	sp, sp, #20
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE248:
	.size	nrf_gpio_cfg_sense_set, .-nrf_gpio_cfg_sense_set
	.section	.text.nrf_gpio_pin_present_check,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	nrf_gpio_pin_present_check, %function
nrf_gpio_pin_present_check:
.LFB274:
	.loc 4 857 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 4 858 14
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #5
	str	r3, [sp, #8]
	.loc 4 859 14
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 4 861 5
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L56
	.loc 4 865 18
	mov	r3, #-1
	str	r3, [sp, #12]
	.loc 4 877 13
	nop
.L56:
	.loc 4 886 16
	ldr	r3, [sp, #4]
	and	r3, r3, #31
	str	r3, [sp, #4]
	.loc 4 888 41
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #4]
	lsr	r3, r2, r3
	.loc 4 888 48
	and	r3, r3, #1
	uxtb	r3, r3
	.loc 4 889 1
	mov	r0, r3
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE274:
	.size	nrf_gpio_pin_present_check, .-nrf_gpio_pin_present_check
	.section	.bss.m_stable_state,"aw",%nobits
	.type	m_stable_state, %object
	.size	m_stable_state, 1
m_stable_state:
	.space	1
	.section	.bss.m_leds_clear,"aw",%nobits
	.type	m_leds_clear, %object
	.size	m_leds_clear, 1
m_leds_clear:
	.space	1
	.section	.bss.m_indication_type,"aw",%nobits
	.align	2
	.type	m_indication_type, %object
	.size	m_indication_type, 4
m_indication_type:
	.space	4
	.section	.bss.m_alert_on,"aw",%nobits
	.type	m_alert_on, %object
	.size	m_alert_on, 1
m_alert_on:
	.space	1
	.section	.data.m_bsp_leds_tmr_data,"aw"
	.align	3
	.type	m_bsp_leds_tmr_data, %object
	.size	m_bsp_leds_tmr_data, 32
m_bsp_leds_tmr_data:
	.space	8
	.word	-1
	.word	-1
	.space	16
	.section	.rodata.m_bsp_leds_tmr,"a"
	.align	2
	.type	m_bsp_leds_tmr, %object
	.size	m_bsp_leds_tmr, 4
m_bsp_leds_tmr:
	.word	m_bsp_leds_tmr_data
	.section	.data.m_bsp_alert_tmr_data,"aw"
	.align	3
	.type	m_bsp_alert_tmr_data, %object
	.size	m_bsp_alert_tmr_data, 32
m_bsp_alert_tmr_data:
	.space	8
	.word	-1
	.word	-1
	.space	16
	.section	.rodata.m_bsp_alert_tmr,"a"
	.align	2
	.type	m_bsp_alert_tmr, %object
	.size	m_bsp_alert_tmr, 4
m_bsp_alert_tmr:
	.word	m_bsp_alert_tmr_data
	.section	.bss.m_registered_callback,"aw",%nobits
	.align	2
	.type	m_registered_callback, %object
	.size	m_registered_callback, 4
m_registered_callback:
	.space	4
	.section	.bss.m_events_list,"aw",%nobits
	.align	2
	.type	m_events_list, %object
	.size	m_events_list, 12
m_events_list:
	.space	12
	.section	.data.m_bsp_button_tmr_data,"aw"
	.align	3
	.type	m_bsp_button_tmr_data, %object
	.size	m_bsp_button_tmr_data, 32
m_bsp_button_tmr_data:
	.space	8
	.word	-1
	.word	-1
	.space	16
	.section	.rodata.m_bsp_button_tmr,"a"
	.align	2
	.type	m_bsp_button_tmr, %object
	.size	m_bsp_button_tmr, 4
m_bsp_button_tmr:
	.word	m_bsp_button_tmr_data
	.section	.rodata.app_buttons,"a"
	.align	2
	.type	app_buttons, %object
	.size	app_buttons, 32
app_buttons:
	.byte	13
	.byte	0
	.byte	3
	.space	1
	.word	bsp_button_event_handler
	.byte	14
	.byte	0
	.byte	3
	.space	1
	.word	bsp_button_event_handler
	.byte	15
	.byte	0
	.byte	3
	.space	1
	.word	bsp_button_event_handler
	.byte	16
	.byte	0
	.byte	3
	.space	1
	.word	bsp_button_event_handler
	.section	.text.bsp_button_is_pressed,"ax",%progbits
	.align	1
	.global	bsp_button_is_pressed
	.syntax unified
	.thumb
	.thumb_func
	.type	bsp_button_is_pressed, %function
bsp_button_is_pressed:
.LFB275:
	.loc 1 113 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 114 8
	ldr	r3, [sp, #4]
	cmp	r3, #3
	bhi	.L59
	.loc 1 116 16
	ldr	r0, [sp, #4]
	bl	bsp_board_button_state_get
	mov	r3, r0
	b	.L60
.L59:
	.loc 1 121 16
	movs	r3, #0
.L60:
	.loc 1 123 1
	mov	r0, r3
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE275:
	.size	bsp_button_is_pressed, .-bsp_button_is_pressed
	.section	.text.bsp_button_event_handler,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	bsp_button_event_handler, %function
bsp_button_event_handler:
.LFB276:
	.loc 1 133 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #28
	.cfi_def_cfa_offset 32
	mov	r3, r0
	mov	r2, r1
	strb	r3, [sp, #7]
	mov	r3, r2
	strb	r3, [sp, #6]
	.loc 1 134 24
	movs	r3, #0
	strb	r3, [sp, #23]
	.loc 1 135 24
	movs	r3, #0
	str	r3, [sp, #16]
	.loc 1 140 14
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r0, r3
	bl	bsp_board_pin_to_button_idx
	str	r0, [sp, #16]
	.loc 1 142 8
	ldr	r3, [sp, #16]
	cmp	r3, #3
	bhi	.L62
	.loc 1 144 9
	ldrb	r3, [sp, #6]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L63
	cmp	r3, #2
	bgt	.L62
	cmp	r3, #0
	beq	.L64
	cmp	r3, #1
	bne	.L62
	.loc 1 147 23
	ldr	r1, .L70
	ldr	r2, [sp, #16]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	add	r3, r3, r1
	ldrb	r3, [r3]
	strb	r3, [sp, #23]
	.loc 1 148 42
	ldr	r1, .L70
	ldr	r2, [sp, #16]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	add	r3, r3, r1
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 148 20
	cmp	r3, #0
	beq	.L65
	.loc 1 150 32
	ldr	r3, .L70+4
	ldr	r2, .L70+8
	mov	r1, #16384
	mov	r0, r3
	bl	app_timer_start
	str	r0, [sp, #12]
	.loc 1 151 24
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L65
	.loc 1 153 50
	ldr	r2, .L70+8
	ldrb	r3, [sp, #7]
	strb	r3, [r2]
.L65:
	.loc 1 156 70
	ldr	r1, .L70
	ldr	r2, [sp, #16]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	add	r3, r3, r1
	adds	r3, r3, #2
	ldrb	r1, [r3]	@ zero_extendqisi2
	.loc 1 156 47
	ldr	r2, .L70+12
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	mov	r2, r1
	strb	r2, [r3]
	.loc 1 157 17
	b	.L62
.L64:
	.loc 1 159 23
	ldr	r3, .L70+4
	mov	r0, r3
	bl	app_timer_stop
	.loc 1 160 42
	ldr	r2, .L70+12
	ldr	r3, [sp, #16]
	add	r3, r3, r2
	ldrb	r1, [r3]	@ zero_extendqisi2
	.loc 1 160 75
	ldr	r0, .L70
	ldr	r2, [sp, #16]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	add	r3, r3, r0
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 160 20
	cmp	r1, r3
	bne	.L68
	.loc 1 162 27
	ldr	r1, .L70
	ldr	r2, [sp, #16]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	add	r3, r3, r1
	adds	r3, r3, #2
	ldrb	r3, [r3]
	strb	r3, [sp, #23]
	.loc 1 164 17
	b	.L68
.L63:
	.loc 1 166 23
	ldr	r1, .L70
	ldr	r2, [sp, #16]
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	add	r3, r3, r1
	adds	r3, r3, #1
	ldrb	r3, [r3]
	strb	r3, [sp, #23]
	b	.L62
.L68:
	.loc 1 164 17
	nop
.L62:
	.loc 1 170 8
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L69
	.loc 1 170 64 discriminator 1
	ldr	r3, .L70+16
	ldr	r3, [r3]
	.loc 1 170 38 discriminator 1
	cmp	r3, #0
	beq	.L69
	.loc 1 172 9
	ldr	r3, .L70+16
	ldr	r3, [r3]
	ldrb	r2, [sp, #23]	@ zero_extendqisi2
	mov	r0, r2
	blx	r3
.LVL0:
.L69:
	.loc 1 174 1
	nop
	add	sp, sp, #28
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L71:
	.align	2
.L70:
	.word	m_events_list
	.word	m_bsp_button_tmr_data
	.word	current_long_push_pin_no.1
	.word	release_event_at_push.0
	.word	m_registered_callback
	.cfi_endproc
.LFE276:
	.size	bsp_button_event_handler, .-bsp_button_event_handler
	.section	.text.button_timer_handler,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	button_timer_handler, %function
button_timer_handler:
.LFB277:
	.loc 1 181 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 182 5
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	movs	r1, #2
	mov	r0, r3
	bl	bsp_button_event_handler
	.loc 1 183 1
	nop
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
	.cfi_endproc
.LFE277:
	.size	button_timer_handler, .-button_timer_handler
	.section	.text.leds_off,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	leds_off, %function
leds_off:
.LFB278:
	.loc 1 191 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	.loc 1 192 9
	ldr	r3, .L80
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 192 8
	cmp	r3, #0
	beq	.L74
.LBB2:
	.loc 1 195 16
	movs	r3, #0
	str	r3, [sp, #4]
	.loc 1 195 9
	b	.L75
.L77:
	.loc 1 197 16
	ldr	r3, [sp, #4]
	cmp	r3, #2
	beq	.L76
	.loc 1 199 17
	ldr	r0, [sp, #