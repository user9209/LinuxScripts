#!/bin/bash

docker image ls

# Remove single image
docker rmi image_name:version/image-id

# Remove all image
docker rmi $(docker images -qf "dangling=true")

# Remove all image !!!
docker rmi $(docker images -q)