#!/bin/bash

# https://megatools.megous.com/man/megaput.html

if [ ! -f "$1" ]; then
	echo "mega_put.sh <file-local>"
	exit 0
fi

megaput --disable-previews --username "<email>" --password "<password>" --no-ask-password "$1"
