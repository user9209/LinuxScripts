#!/bin/bash

path_in=demo
file_out=archiv.tar.gz.twofish.camellia
password1=`openssl rand -base64 32`
password2=`openssl rand -base64 32`

find "$path_in" -mtime -7 -type f -print0 \
| tar -czvO --null -T - \
| gpg --batch --no-tty --yes --symmetric \
--cipher-algo twofish --s2k-count 10 --s2k-mode 1 \
--digest-algo sha512 \
--passphrase "$password1" --output - \
| openssl enc -camellia-256-cbc -a -k "$password2" -out "$file_out"


echo "$password1 $password2" | gpg --batch --no-tty --yes -a --encrypt --sign --cipher-algo CAMELLIA256 --digest-algo sha512 -r 7AC76165E09F96B70F7574EA0D9BA8E30002088D --output "$file_out.key"