#!/bin/bash
cd /mnt/server/
sleep 1
# Make internal Docker IP address available to processes.
# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`


# Run the Server
eval ${STARTUP}
