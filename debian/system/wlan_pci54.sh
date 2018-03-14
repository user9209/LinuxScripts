apt-get install wpasupplicant



# PCI WLAN 54:
#  Network controller: Intersil Corporation ISL3886 [Prism Javelin/Prism Xbow] (rev 01)
wget https://daemonizer.de/prism54/prism54-fw/fw-softmac/2.13.25.0.arm --no-check-certificate
mv 2.13.25.0.arm /lib/firmware/isl3886pci
modprobe -r p54pci ; modprobe p54pci

ip addr
iwconfig


# Not existing any more !!!
# apt-get install linux-firmware-nonfree


# Tools
apt-get install wpasupplicant
iwlist
iwlist  scanning
