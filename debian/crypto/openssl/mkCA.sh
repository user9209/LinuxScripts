#!/bin/bash
openssl req -new -sha512 -nodes -newkey rsa:4096 -keyout CA.key -out CA.csr
openssl x509 -req -sha512 -extfile x509.ext -extensions ca -in CA.csr -signkey CA.key -days 7300 -out CA.crt
rm CA.csr
cat ca.crt > ca.pem
cat ca.key >> ca.pem
