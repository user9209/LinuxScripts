#!/bin/bash
baseCA=`dirname "$0"`/ca
baseD=`dirname "$0"`/clients

if [ ! -d $baseD ]
 mkdir -p $baseD
fi

openssl req -new -sha512 -nodes -newkey rsa:4096 -keyout $baseD/server.key -out $baseD/server.csr
openssl x509 -req -sha512 -CA $baseCA/CA.crt -CAkey $baseCA/CA.key -days 3650 -CAcreateserial -CAserial $baseCA/CA.srl -extfile x509.ext -extensions server -in $baseD/server.csr -out $baseD/server.crt
rm $baseD/server.csr
cat $baseD/server.crt > $baseD/server.pem
cat $baseD/server.key >> $baseD/server.pem
