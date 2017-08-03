#!/bin/bash

file_in=archiv.tar.gz.twofish.camellia
path_out=demo2
password1=pass1
password2=test1

if [ ! -d "$path_out" ] ;then
        mkdir -p "$path_out"
fi

openssl enc -d -camellia-256-cbc -a -k "$password2" -in "$file_in" -out - \
| gpg --batch --no-tty --yes --decrypt \
--cipher-algo twofish --s2k-count 10 --s2k-mode 1 \
--digest-algo sha512 \
--passphrase "$password1" --output - \
| tar -xvz --directory="$path_out"