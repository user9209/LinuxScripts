#!/bin/bash
password=1234
file=$1
gpg --symmetric --batch --armor --cipher-algo CAMELLIA256 --digest-algo SHA512 --compress-algo bzip2 --passphrase "$password" --output "$file.gpg-sym" "$file"
