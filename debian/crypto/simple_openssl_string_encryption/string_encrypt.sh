#!/bin/bash

# base64
#echo -n "$1" | openssl enc -e -camellia-256-cbc -a -salt | tr -d '\n'

# hex
echo -n "$1" | openssl enc -e -camellia-256-cbc -salt | xxd -plain | tr -d '\n'

echo ""