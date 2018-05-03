#!/bin/bash
size=16384
name=$1
mail=$2
pw=$3

echo "Generate Key for '$name' '$mail' '$pw' with '$size' bits?"
read pause1

cat >tempconf <<EOF
     %echo Generating a basic OpenPGP key
     Key-Type: RSA
     Key-Length: $size
     Subkey-Type: RSA
     Subkey-Length: $size
     Preferences: SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
     Name-Real: $name
     Name-Email: $mail
     Expire-Date: 10y
     Passphrase: $pw
     # Do a commit here, so that we can later print "done" :-)
     %commit
     %echo done
EOF

gpg2 --batch --generate-key tempconf
rm tempconf
