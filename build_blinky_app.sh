#!/bin/bash

newt target create nrf5340_blinky
newt target set nrf5340_blinky app=apps/blinky
newt target set nrf5340_blinky bsp=@apache-mynewt-core/hw/bsp/nordic_pca10095
newt target set nrf5340_blinky build_profile=debug
newt build nrf5340_blinky
newt create-image nrf5340_blinky 1.0.0

newt load nrf5340_blinky
