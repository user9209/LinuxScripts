#!/bin/bash
#cp ./tools/* /bin/
#cp ./rtools/* /sbin/
cp ../../debian/update/updater /sbin/
cp ../../debian/hash/sha3sum /bin/
cp ../../debian/gpg/scripts/mkGPGkey_v2.sh /bin/makeGPGkey
cp ../../debian/files/search_filter/last30days.sh /bin/last30daysChanged

chmod 555 /sbin/updater
chmod 555 /bin/sha3sum
chmod 555 /bin/makeGPGkey
chmod 555 /bin/last30daysChanged
