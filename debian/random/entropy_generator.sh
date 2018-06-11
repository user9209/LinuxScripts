#!/bin/bash
apt-get install haveged

# or
apt-get install rng-tools
/etc/init.d/rng-tools start



# test
cat /proc/sys/kernel/random/entropy_avail
