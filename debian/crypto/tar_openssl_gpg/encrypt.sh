#!/bin/bash

path_in=demo
file_out=archiv.tar.gz.twofish.camellia
password1=pass1
password2=test1

find "$path_in" -mtime -7 -type f -print0 \
| tar -czvO --null -T - \
| gpg --batch --no-tty --yes --symmetric \
--cipher-algo twofish --s2k-count 10 --s2k-mode 1 \
--digest-algo sha512 \
--passphrase "$password1" --output - \
| openssl enc -camellia-256-cbc -a -k "$password2" -out "$file_out"