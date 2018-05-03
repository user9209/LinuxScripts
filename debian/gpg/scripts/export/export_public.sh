#!/bin/bash
if [ -z $1 ] ; then
	echo "gpg --export <fingerprint> > <fingerprint>_pub.asc"
else
	gpg --export -a $1 > $1_pub.asc
fi