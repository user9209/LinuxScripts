#!/bin/bash
if [ ! -t 0 ]; then
	std_in=($(< /dev/stdin))
else
	std_in=""
fi

# ${#std_in} is byte if LANG=C LC_ALL=C
LANG=C LC_ALL=C

tmpfile=`mktemp`

if [ "$1" == "e" ] && [ "$2" != "" ] && [ ${#std_in} -gt 0 ] ;then
	echo>$tmpfile "$std_in" && echo "$2" | gpg --cipher-algo CAMELLIA256 --output - --passphrase-fd 0 --batch --yes --symmetric $tmpfile | base64 && rm $tmpfile
elif [ "$1" == "e" ] && [ "$2" != "" ] && [ "$3" != "" ] ;then
	echo>$tmpfile "$3" && echo "$2" | gpg --cipher-algo CAMELLIA256 --output - --passphrase-fd 0 --batch --yes --symmetric $tmpfile | base64 && rm $tmpfile
elif [ "$1" == "d" ] && [ "$2" != "" ] && [ ${#std_in} -gt 0 ] ;then
	echo "$std_in" | base64 -d>$tmpfile && echo "$2" | gpg --cipher-algo CAMELLIA256 --decrypt --output - --passphrase-fd 0 --batch --yes $tmpfile 2>/dev/null && rm $tmpfile
elif [ "$1" == "d" ] && [ "$2" != "" ] && [ "$3" != "" ] ;then
	echo "$3" | base64 -d>$tmpfile && echo "$2" | gpg --cipher-algo CAMELLIA256 --decrypt --output - --passphrase-fd 0 --batch --yes $tmpfile 2>/dev/null && rm $tmpfile
else
	echo
	echo "encrypt: `basename $0` e <password> <stringToCrypt>"
	echo "or: echo <stringToCrypt> | `basename $0` e <password>"
	echo
	echo "decrypt: `basename $0` d <password> <stringCrypted>"
	echo "or: echo <stringCrypted> | `basename $0` d <password>"
	echo
fi