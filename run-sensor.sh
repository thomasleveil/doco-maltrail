#!/bin/bash
set -eu

# set promiscuous mode
for dev in $(ls /sys/class/net); do
	echo Setting promicuous mode for $dev
	ip link set $dev promisc on
done

cd /maltrail
echo staring sensor...
exec python sensor.py
