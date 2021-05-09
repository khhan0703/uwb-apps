#!/bin/bash

RND_PORT1=`date +%S`
RND_PORT2=`date +%M`
RND_PORT=$(($RND_PORT1 * 100 + $RND_PORT2 * 10 + 3333))
echo "DEBUG PORT : $RND_PORT"
echo "export DEBUG PORT=$RND_PORT" > set_debug_port.sh
. ./set_debug_port.sh

