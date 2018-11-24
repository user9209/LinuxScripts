#!/bin/bash

# base64
#echo -n "$1" | openssl enc -d -camellia-256-cbc -a -salt
# hex
echo -n "$1" | xxd -plain -revert | openssl enc -d -camellia-256-cbc -salt

echo ""