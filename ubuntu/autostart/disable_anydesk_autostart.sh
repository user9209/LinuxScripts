#!/bin/bash

systemctl stop anydesk.service
systemctl disable anydesk.service

#mkdir -p ~/.disabled
#mv /etc/xdg/autostart/anydesk.desktop ~/.disabled/anydesk.desktop.disabled
