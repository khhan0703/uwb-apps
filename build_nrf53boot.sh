#!/bin/bash

RND_PORT1=`date +%S`
RND_PORT2=`date +%M`
RND_PORT=$(($RND_PORT1 * 100 + $RND_PORT2 * 10 + 3333))
echo "DEBUG PORT : $RND_PORT"
echo "export DEBUG PORT=$RND_PORT" > set_debug_port.sh
. ./set_debug_port.sh

newt target create nrf5340_boot
newt target set nrf5340_boot app=@mcuboot/boot/mynewt
newt target set nrf5340_boot bsp=@apache-mynewt-core/hw/bsp/nordic_pca10095
newt target set nrf5340_boot build_profile=optimized
newt build nrf5340_boot
RESULT=$?
if [ $RESULT -eq 0 ]; then
	newt run nrf5340_boot 0
else 
	echo ERROR BUILD
fi
