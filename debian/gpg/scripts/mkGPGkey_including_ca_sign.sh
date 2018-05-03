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


##
##	In this version all generated keys are signed by a default, CA like, key.
##	Replace A9CB7896D96B0E8F416A2581693BE19E14687187 with our key !!!
##
##	Before generating a key it is checked, if the mail address still exists.
##


if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ] || [ "$5" != "" ] ; then
	echo -e "<script>.sh <name> <mail> <pw> [<key-size>]\nValues can set to 'none'."
else

echo "Run"

if [ "$4" == "" ]; then
	# may be 16384 at unlimit gpg2
	size=4096
else
	size=$4
fi

name=$1
mail=$2
pw=$3

# vorhanden?
gpg2 --fingerprint $mail >>/dev/null
if [ "$?" == "2" ] && [ "$mail" != "none" ]; then
	found=0
else
	found=1
fi

# Set parameter

if [ "$name" == "none" ]; then
	name=""
else

	name="Name-Real: $name"
fi

if [ "$mail" == "none" ]; then
	mail=""
else
	mail="Name-Email: $mail"
fi

if [ "$pw" == "none" ]; then
	pw="%no-protection"
	pw2="%no-ask-passphrase"
else
	pw="Passphrase: $pw"
	pw2=""
fi

echo "Generate Key for '$name' '$mail' '$pw' with '$size' bits?"
read pause1

cat >tempconf <<EOF
     %echo Generating a basic OpenPGP key
     Key-Type: RSA
     Key-Length: $size
     Subkey-Type: RSA
     Subkey-Length: $size
     Preferences: SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
     $name
     $mail
     Expire-Date: 15y
     $pw
     $pw2
     # Do a commit here, so that we can later print "done" :-)
     %commit
     %echo done
EOF

gpg2 --batch --gen-key tempconf
rm tempconf

# sign keys
if [ "$found" == "0" ]; then

	if ["$mail" == "" ]; then
		mail=$1
	else
		mail=$2
	fi

	fingerprint=`gpg2 --fingerprint $mail |cut -d$'\n' -f2 | sed 's/ //g'`
	echo "$fingerprint"
	# TODO: use your own key
	gpg2 --default-key A9CB7896D96B0E8F416A2581693BE19E14687187 --sign-key $fingerprint
fi


fi
exit 0
