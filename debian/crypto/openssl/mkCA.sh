#!/bin/bash

baseD=`dirname "$0"`/ca

if [ ! -d $baseD ]; then
 mkdir -p $baseD
fi

openssl req -new -sha512 -nodes -newkey rsa:4096 -keyout $baseD/CA.key -out $baseD/CA.csr
openssl x509 -req -sha512 -extfile x509.ext -extensions ca -in $baseD/CA.csr -signkey $baseD/CA.key -days 7300 -out $baseD/CA.crt
rm $baseD/CA.csr
cat $baseD/CA.crt > $baseD/CA.pem
cat $baseD/CA.key >> $baseD/CA.pem
