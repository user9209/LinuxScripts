#!/bin/bash
# /etc/systemd/system/teamviewerd.service
# /opt/teamviewer/tv_bin/teamviewerd -d
service teamviewerd stop
systemctl disable teamviewerd.service

service teamviewerd status
