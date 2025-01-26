#!/bin/bash

rsync -e 'ssh -p 2222' -a -h  --partial --progress --sparse --one-file-system \
 --no-compress --acls --xattrs --numeric-ids --info=progress2  --stats \
 --log-file=rsync.log --hard-links \
 --exclude=dev --exclude=tmp \
 src-dir \
 dest-dir

#  -PSvahHAXx 
# -P -S -v -a -h -H -A -X -x
#  --sparse  --archive --human-readable --hard-links --one-file-system --acls --xattrs 
# --iconv

##  --log-file-format= --out-format=
# https://linux.die.net/man/1/rsync
