#!/bin/bash
username=root
password=`openssl rand 32 | sha1sum -b | cut -d' ' -f1`

# needs: apt install whois
crypted_password=`mkpasswd --hash=SHA-512 $password`

# echo "$password"
# echo "$crypted_password"
# echo "usermod -p $crypted_password $username"
echo "Enter current root password (default: root):"
su -c "usermod -p ${crypted_password@Q} $username"

if [ $? -eq 0 ]
then
  echo "Password is set to random!"
  exit 0
else
  echo "Setting password had failed!"
  exit 1
fi

# outtakes:

# apt-get install makepasswd


#su - root <<!
#sR75lVR42
#usermod -p ${crypted_password@Q} $username
#!
