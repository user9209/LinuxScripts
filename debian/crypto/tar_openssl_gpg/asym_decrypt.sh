#!/bin/bash

file_in=archiv.tar.gz.twofish.camellia
path_out=demo2

pw_mix=`gpg --batch --no-tty --yes -a --decrypt --cipher-algo CAMELLIA256 --digest-algo sha512 --output - "$file_in.key"`

password1=${pw_mix%% *}
password2=${pw_mix#* }

if [ ! -d "$path_out" ] ;then
    mkdir -p "$path_out"
fi

set -o pipefail

openssl enc -d -camellia-256-cbc -a -k "$password2" -in "$file_in" -out - \
| gpg --batch --no-tty --yes --decrypt \
  --cipher-algo twofish --s2k-count 10 --s2k-mode 1 \
  --digest-algo sha512 \
  --passphrase "$password1" --output - \
| tee >(sha512sum>/dev/shm/msg_d -c "$file_in.sha512"; echo>/dev/shm/error_453534534 "$?") \
| gunzip -c \
| tar -xv --directory="$path_out"
# may throw a error:            tar: Child returned status 2 tar: Error is not recoverable: exiting now
#| tar -xvz --directory="$path_out"

err1=$?
err2=`cat /dev/shm/error_453534534`
rm /dev/shm/error_453534534

if [ $err1 -eq 0 ] && [ $err2 -eq 0 ]; then
    echo "Success!"
else
    echo "Failed!"
fi

