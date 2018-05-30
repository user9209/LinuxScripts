# pem -> der
openssl x509 -in cert.der -inform der -outform pem -out cert.pem
