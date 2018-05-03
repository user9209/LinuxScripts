#!/bin/bash

# start container
docker container start webserver

# start apache2
docker exec -t webserver service apache2 start
