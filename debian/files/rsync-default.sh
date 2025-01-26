#!/bin/bash

rsync -e 'ssh -p 2222' -a -h  --partial --progress --sparse --one-file-system \
 --no-compress --acls --xattrs --numeric-ids --info=progress2  --stats \
 --log-file=rsync.log --hard-links \
 --exclude=dev --exclude=tmp \
 src-dir \
 dest-dir
 
# --exclude= sowie -x schließt einige temporäre Dateien sowie andere Datenträger aus.
# Details zu den genauen Unterschieden von ein- bis dreifachen * befinden sich in der
# Manpage. Vereinfacht ausgedrückt, ergreift * nur sichtbare Ordner und Dateien, aber
# nicht den Ordner selbst, ** ergreift auch unsichtbare Inhalte eines Ordners, aber 
# ebenfalls nicht den Ordner selbst. *** ergreift ebenfalls einen Ordner einschließlich
# versteckter Elemente darin, aber diesmal auch einschließlich des Ordners selbst.

#  -PSvahHAXx 
# -P -S -v -a -h -H -A -X -x
#  --sparse  --archive --human-readable --hard-links --one-file-system --acls --xattrs 
# --iconv

##  --log-file-format= --out-format=
# https://linux.die.net/man/1/rsync
