#!/bin/bash

if [ "$1" != "" ] && [ "$2" != "" ]
then
	file=$1
	recipient=$2

	gpg --output $file.gpg --encrypt --recipient $recipient $file
else
        echo "'script <file> <recipient>'"
fi
exit 0