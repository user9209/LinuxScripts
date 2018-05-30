#!/bin/bash

baseD=`dirname "$0"`/ca

name=$1

if [ "$1" == "" ]; then
  echo "./mkCA.sh <cn>"
  exit 0
fi


if [ ! -d $baseD ]; then
 mkdir -p $baseD
fi

openssl req -new -sha512 -nodes -newkey rsa:4096 -keyout $baseD/$name.key -out $baseD/$name.csr \
  -subj "/C=DE/O=GS-SYS/CN=$name"
openssl x509 -req -sha512 -extfile x509.ext -extensions ca -in $baseD/$name.csr -signkey $baseD/$name.key -days 7300 -out $baseD/$name.crt
rm $baseD/$name.csr
cat $baseD/$name.crt > $baseD/$name.pem
cat $baseD/$name.key >> $baseD/$name.pem