#!/bin/bash
rm /home/user/.config/autostart/anydesk.desktop
rm /home/user/.config/autostart/anydesk_global_tray.desktop

service anydesk stop
systemctl disable anydesk.service

service anydesk status
