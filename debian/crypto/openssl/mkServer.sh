#!/bin/bash
openssl req -new -sha512 -nodes -newkey rsa:4096 -keyout server.key -out server.csr
openssl x509 -req -sha512 -CA CA.crt -CAkey CA.key -days 3650 -CAcreateserial -CAserial CA.srl -extfile x509.ext -extensions server -in server.csr -out server.crt
rm server.csr
cat server.crt > server.pem
cat server.key >> server.pem
