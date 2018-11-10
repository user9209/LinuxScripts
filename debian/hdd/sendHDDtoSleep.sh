#!/bin/bash
hdparm -y /dev/sda
hdparm -y /dev/sdb
hdparm -y /dev/sdd

# check status without starting the hdd:
# smartctl -i -n standby /dev/sda
# or
# hdparm -C /dev/sda

