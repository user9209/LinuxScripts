#!/bin/bash

if [ -d ./gitcrypto ]; then
	cp ./gitcrypto/.gitattributes ./.gitattributes
	
	# add config
	if [ "`cat ./.git/config | grep clean`" == "" ]; then
		cat ./gitcrypto/config >> ./.git/config
	fi
	
	mkdir ./.git/crypto
	cp ./gitcrypto/crypto/* ./.git/crypto/
	chmod 700 ./.git/crypto/*
	git reset --hard
	echo "Enabled"
else
	mkdir ./gitcrypto
	mkdir ./gitcrypto/crypto/
	cp ./.gitattributes ./gitcrypto/.gitattributes
	cp ./.git/config ./gitcrypto/config
	cp ./.git/crypto/* ./gitcrypto/crypto/
	echo "Backuped"
fi

exit 0