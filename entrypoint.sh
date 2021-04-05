#!/bin/bash
cd /mnt/server/
sleep 1
# Make internal Docker IP address available to processes.
# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
echo "
████████╗███████╗░█████╗░███╗░░░███╗██╗░░░██╗███╗░░██╗░█████╗░██╗░░██╗██╗███████╗░██████╗
╚══██╔══╝██╔════╝██╔══██╗████╗░████║██║░░░██║████╗░██║██╔══██╗██║░░██║██║██╔════╝██╔════╝
░░░██║░░░█████╗░░███████║██╔████╔██║██║░░░██║██╔██╗██║██║░░╚═╝███████║██║█████╗░░╚█████╗░
░░░██║░░░██╔══╝░░██╔══██║██║╚██╔╝██║██║░░░██║██║╚████║██║░░██╗██╔══██║██║██╔══╝░░░╚═══██╗
░░░██║░░░███████╗██║░░██║██║░╚═╝░██║╚██████╔╝██║░╚███║╚█████╔╝██║░░██║██║███████╗██████╔╝
░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝░░╚══╝░╚════╝░╚═╝░░╚═╝╚═╝╚══════╝╚═════╝░"

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
