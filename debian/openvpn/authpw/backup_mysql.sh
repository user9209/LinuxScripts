#!/bin/bash

# Copyright 2013 u 2014 - Georg Schmidt

var=$(date +%Y_%m_%d_%H_%mUhr)

echo "User: openvpn"
mysqldump openvpn -u openvpn -p > openvpn_$var.sql

sed -i"" '17a\-- Create Database, if not exist\nCREATE DATABASE IF NOT EXISTS `openvpn`;\n' openvpn_$var.sql
