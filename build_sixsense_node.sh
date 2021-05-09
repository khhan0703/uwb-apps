#!/bin/bash

RND_PORT1=`date +%S`
RND_PORT2=`date +%M`
RND_PORT=$(($RND_PORT1 * 100 + $RND_PORT2 * 10 + 3333))
echo "DEBUG PORT : $RND_PORT"
echo "export DEBUG PORT=$RND_PORT" > set_debug_port.sh
. ./set_debug_port.sh

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
