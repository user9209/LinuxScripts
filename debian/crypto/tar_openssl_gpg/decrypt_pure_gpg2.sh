#!/bin/bash

file_in=archiv.tar.gz.twofish.camellia
path_out=demo2
password1=pass1
password2=test1

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
| tar -xvz --directory="$path_out"