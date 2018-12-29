#!/bin/bash

# (c) 2018 Georg Schmidt
# 28.12.2018

echo "$1" | sed -rn 's/https:\/\/([^/]+)\/(.+)/git@\1:\2.git/p'
