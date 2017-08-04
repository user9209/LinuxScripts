#!/bin/bash

# https://megatools.megous.com/man/megaget.html

if [ "$1" == "" ]; then
	echo "mega_get.sh <file-remote> [<dir-local>]"
	exit 0
else
	file_get=$1
fi

if [ ! -d "$2" ]; then
	dir_out=./
else
	dir_out=$2
fi

megaget --path "$dir_out" --username "<email>" --password "<password>" --no-ask-password "/Root/$file_get"
