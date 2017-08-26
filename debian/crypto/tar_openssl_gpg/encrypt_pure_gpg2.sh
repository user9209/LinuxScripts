#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]; then
   echo "Missing password!"
   exit -1
fi

path_in=~
file_out=/tmp/archiv.tar.gz.twofish.camellia
password1=$1
password2=$2

find "$path_in" -mtime -7 -type f -print0 \
| tar -czvO --null -T - \
| tee >(sha512sum > "$file_out.sha512") \
| gpg --batch --no-tty --yes --symmetric \
--cipher-algo twofish --s2k-count 10 --s2k-mode 1 \
--digest-algo sha512 \
--passphrase "$password1" --output - \
| gpg --batch --no-tty --yes --symmetric \
--cipher-algo CAMELLIA256 --s2k-count 10 --s2k-mode 1 \
--digest-algo sha512 \
--passphrase "$password2" --output - \
| base64 >"$file_out"

echo "Backup complete"