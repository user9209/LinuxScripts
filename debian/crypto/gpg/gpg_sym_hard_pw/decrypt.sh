#!/bin/bash
password=1234
file=$1
extension="${file##*.}"
filename="${file%.*}"

gpg --decrypt --batch --armor --cipher-algo CAMELLIA256 --digest-algo SHA512 --compress-algo bzip2 --passphrase "$password" --output "$filename" "$file"
#echo "gpg --decrypt --batch --armor --cipher-algo CAMELLIA256 --digest-algo SHA512 --compress-algo bzip2 --passphrase \"$password\" --output \"$filename\" \"$file\""
if [ $? -eq 2 ]; then
  echo "still exist, skipped!"
fi
