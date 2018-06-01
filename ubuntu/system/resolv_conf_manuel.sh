#!/bin/bash

# remove resolvconf
apt-get purge resolvconf

# disable man:systemd-resolved(8)
systemctl disable systemd-resolved.service
service systemd-resolved stop

# /etc/resolv.conf -> ../run/systemd/resolve/stub-resolv.conf

# create static dns server
rm /etc/resolv.conf
echo > /etc/resolv.conf "nameserver 192.168.1.1"

