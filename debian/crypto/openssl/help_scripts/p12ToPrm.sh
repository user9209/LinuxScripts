# p12 / pfx -> pem
openssl pkcs12 -in keyStore.p12 -out keyStore.pem -nodes
