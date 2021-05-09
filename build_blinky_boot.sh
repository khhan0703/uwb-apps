#!/bin/bash

newt target create nrf5340_boot
newt target set nrf5340_boot app=@mcuboot/boot/mynewt
newt target set nrf5340_boot bsp=@apache-mynewt-core/hw/bsp/nordic_pca10095
newt target set nrf5340_boot build_profile=optimized
newt build nrf5340_boot
newt create-image nrf5340_boot 1.0.0

nrfjprog --recover
newt load nrf5340_boot
