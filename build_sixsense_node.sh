#!/bin/bash

. ./build_common.sh

newt target create sixsense_node
newt target set sixsense_node app=apps/sixsense_r1
newt target set sixsense_node bsp=@decawave-uwb-core/hw/bsp/dwm1001
newt target set sixsense_node build_profile=debug
newt target amend sixsense_node syscfg=LOG_LEVEL=1:UWBCFG_DEF_ROLE='"0x4"':CONSOLE_UART_BAUD=115200:CONSOLE_RTT=0:UWBCFG_DEF_FRAME_FILTER='"0x00F"'
newt build dwm1001_boot
RESULT=$?
if [ $RESULT -eq 0 ]; then
	newt run sixsense_node 0
else 
	echo ERROR BUILD
fi
