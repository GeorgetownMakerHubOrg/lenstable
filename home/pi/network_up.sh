#!/bin/bash

touch /home/pi/networkup.touched

for pid in $(pidof -x network_up.sh); do
    if [ $pid != $$ ]; then
        echo "network_up.sh : Process is already runnning with PID $pid"
        exit 1
    fi
done

ntpdate -u time.nist.gov
cd /home/pi/lenstable
/usr/bin/git pull
