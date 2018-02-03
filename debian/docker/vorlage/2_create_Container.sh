#!/bin/bash

mkdir www-data
docker run --name webserver --hostname=webserver -d -p 8000:9090 -p 8080:80 -v /dockershare:/dockershare webserver