# Debian 12 with ZFS 2.2.6

09.10.2024

## Enabled backports

````
# bookworm-backports, previously on backports.debian.org
deb http://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
````

## Install backports

````
apt install -t bookworm-backports zfsutils-linux zfs-dkms zfs-zed
````

### Verify

````
reboot
zfs version
````

should be

````
# zfs version
zfs-2.2.6-1~bpo12+2
zfs-kmod-2.2.6-1~bpo12+2
````


