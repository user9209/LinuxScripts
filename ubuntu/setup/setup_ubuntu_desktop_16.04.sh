#!/bin/bash

apt purge -y gnome-mpv abiword gnumeric mplayer activity-log-manager

apt install -y gparted htop numlockx haveged sshfs smbclient \
p7zip openjdk-8-jre-headless \
git  qrencode \
vlc gimp gpa luckybackup gnome-screenshot xarchiver \
openjdk-8-jre openjfx chromium-browser \
catfish synapse \
libreoffice libreoffice-l10n-de libreoffice-help-de


apt auto-remove 
# optional
## arandr
