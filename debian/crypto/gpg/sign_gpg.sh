#!/bin/bash

if [ "$1" == "-c" ] && [ "$2" != "" ]
then
        echo "verify:"
        file=$2
        gpg --verify $file
        exit 0
elif [ "$1" != "" ]
then
        echo "generate:"
        file=$1
   # gpg --list-keys --fingerprint
        gpg --default-key BA9E0E601FD5346073C9512EE3AF75E3EAC54061 --output $file.sig --detach-sig $file
        exit 0
else
        echo "'script -c <signature-file>' or 'script <file>'"
        exit 0
fi
# file inside
# gpg --output $file.sig --sign $file
# gpg --output $file_out --decrypt $file
