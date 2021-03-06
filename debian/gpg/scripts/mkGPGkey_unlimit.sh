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
##	This version requires a mail address or a name.
##  Not both must be entered!
##

if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ] || [ "$5" != "" ] ; then

echo -e "<script>.sh <name> <mail> <pw> [<key-size>]\nValues can set to 'none'."

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

tmp_file=`mktemp`
cat >$tmp_file <<EOF
     %echo Generating a basic OpenPGP key
     Key-Type: RSA
     Key-Usage: sign
     Key-Length: $size
     Subkey-Type: RSA
     Subkey-Length: $size
     Subkey-Usage: encrypt
     Preferences: SHA512 SHA384 SHA256 SHA224 CAMELLIA256 TWOFISH AES256 CAMELLIA192 AES192 Uncompressed ZIP ZLIB BZIP2
     $name
     $mail
     Expire-Date: 15y
     $pw
     $pw2
     # Do a commit here, so that we can later print "done" :-)
     %commit
     %echo done
EOF

#if [ ! -d /tmp/gpg-home ]; then
# mkdir -p /tmp/gpg-home
# chmod 700 /tmp/gpg-home
#fi

#export GNUPGHOME=/tmp/gpg-home
#/bin/gpg_unlimit --batch --homedir /tmp/gpg-home/ --gen-key $tmp_file

# gpg-agent --daemon
# ulimit -l unlimited
/bin/gpg_unlimit --batch --gen-key $tmp_file
rm $tmp_file

fi
