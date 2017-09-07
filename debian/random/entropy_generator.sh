#!/bin/bash
apt-get install rng-tools
/etc/init.d/rng-tools start

cat /proc/sys/kernel/random/entropy_avail
