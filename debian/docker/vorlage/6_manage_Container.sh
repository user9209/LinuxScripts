#!/bin/bash

# Running container
docker ps
#--label


# All container
docker ps -a
docker container ls -a


docker ps -s


# stop all container
docker stop `docker ps -aq`

# remove all container
docker rm `docker ps -aq`