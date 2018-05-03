#!/bin/bash
if [ -z $1 ] ; then
	echo "gpg --export <fingerprint> > <fingerprint>_sec.asc"
else
	gpg --export-secret-key -a $1 > $1_sec.asc
	# gpg --export-secret-key -a --export-options export-reset-subkey-passwd $1 > $1_nop_sec.asc
fi