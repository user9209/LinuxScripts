#!/bin/bash
echo "$1" |sed -r "s/https:\/\/(.+)/ssh:\/\/git@\1.git/g"
