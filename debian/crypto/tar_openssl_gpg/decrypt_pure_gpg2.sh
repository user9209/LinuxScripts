#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]; then
   echo "Missing password!"
   exit -1
fi

file_in=/tmp/archiv.tar.gz.twofish.camellia
path_out=/tmp/aaa
password1=$1
password2=$2

if [ ! -d "$path_out" ] ;then
        mkdir -p "$path_out"
fi

cat "$file_in" | base64 -d | \
gpg --batch --no-tty --yes --decrypt \
--cipher-algo CAMELLIA256 --s2k-count 10 --s2k-mode 1 \
--digest-algo sha512 \
--passphrase "$password2" --output - \
| gpg --batch --no-tty --yes --decrypt \
--cipher-algo twofish --s2k-count 10 --s2k-mode 1 \
--digest-algo sha512 \
--passphrase "$password1" --output - \
| tee >(sha512sum > "$file_out.sha512") \
| tar -xvz --directory="$path_out"

echo "Recovery complete"