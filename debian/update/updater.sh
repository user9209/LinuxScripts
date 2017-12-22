#!/bin/bash

# author: Georg Schmidt <gs-develop@gs-sys.de>
# version: 01.2017

## location: /sbin/updater
# cp updater.sh /sbin/updater
# chmod 0555 /sbin/updater

apt-get update
apt-get -y dist-upgrade

apt-get -y autoremove
apt-get -y autoclean

# store time in log file
echo>>/var/log/updater-gs.log $(date)