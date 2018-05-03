#!/bin/bash

apt-get -y remove docker docker-engine docker.io

apt-get install -y apt-transport-https ca-certificates wget software-properties-common

wget https://download.docker.com/linux/debian/gpg 

apt-key add gpg

echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee -a /etc/apt/sources.list.d/docker.list

apt-get update

# should be "Candidate: xx.xx.x~ce-x~debian"
apt-cache policy docker-ce

apt-get -y install docker-ce

# start docker
systemctl start docker

# stop docker
systemctl stop docker