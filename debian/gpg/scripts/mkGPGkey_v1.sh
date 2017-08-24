#!/bin/bash

#    Copyright (C) 2017  Georg Schmidt <gs-develop@gs-sys.de>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ] || [ "$5" != "" ] ; then

echo "<script>.sh <name> <mail> <pw> [<key-size>]"

else

if [ "$4" == "" ]; then
	# may be 16384 at unlimit gpg2
	size=4096
else
	size=$4
fi
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

gpg2 --batch --gen-key tempconf
rm tempconf

fi
