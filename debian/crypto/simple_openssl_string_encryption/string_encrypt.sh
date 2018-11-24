#!/bin/bash

# base64
#echo -n "$1" | openssl enc -e -camellia-256-cbc -a -salt | tr -d '\n'

if [ -z $1 ];
then
	read -p "Enter your text: " input
else
    input=$1
fi

# hex
echo -n "$input" | openssl enc -e -camellia-256-cbc -salt | xxd -plain | tr -d '\n'

echo ""