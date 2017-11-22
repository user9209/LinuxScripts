#!/bin/bash

if [ "$1" != "" ] && [ "$2" != "" ]
then
	file_in=$1
	file_out=$2

	gpg --output $file_out --decrypt $file_in
else
        echo "'script <file_in> <file_out>'"
fi
exit 0