#!/bin/bash

# author: Georg Schmidt <gs-develop@gs-sys.de>
# version: 01.2017

# chmod 700 /Anpassungen/boot_system_info.sh
# nano /etc/rc.local -> /Anpassungen/boot_system_info.sh

echo>/etc/issue "Debian GNU/Linux 9 \\n \\l"
echo>>/etc/issue ""
echo>>/etc/issue "Benutzer:"
echo>>/etc/issue "root & default-server-password"
echo>>/etc/issue ""
if [ -f /etc/ssh/sshd_config ]
then
   echo>>/etc/issue "SSH $(egrep "^Port ([0-9]+)$" /etc/ssh/sshd_config)"
fi

if [ "$(egrep "^[^#]+ipv6\.disable=1.+$" /etc/default/grub)" != "" ]
then
  echo>>/etc/issue "IPv6 ist deaktiviert (grub2)"
fi
echo>>/etc/issue ""
echo>>/etc/issue "IPs: $(hostname -I)"
echo>>/etc/issue ""

#Farbe
tput setaf 2

exit 0
