#!/bin/bash


file_in=archiv.tar.gz.twofish.camellia
path_out=demo2

pw_mix=`gpg --batch --no-tty --yes -a --decrypt --cipher-algo CAMELLIA256 --digest-algo sha512 --output - "$file_in.key"`

password1=${pw_mix%% *}
password2=${pw_mix#* }

if [ ! -d "$path_out" ] ;then
        mkdir -p "$path_out"
fi

openssl enc -d -camellia-256-cbc -a -k "$password2" -in "$file_in" -out - \
| gpg --batch --no-tty --yes --decrypt \
--cipher-algo twofish --s2k-count 10 --s2k-mode 1 \
--digest-algo sha512 \
--passphrase "$password1" --output - \
| tar -xvz --directory="$path_out"