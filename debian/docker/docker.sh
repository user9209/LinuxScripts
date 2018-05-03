https://www.itzgeek.com/how-tos/linux/debian/how-to-install-docker-on-debian-9.html

https://t3n.de/news/docker-diesen-tutorials-gelingt-879001/

https://jaxenter.de/einfuehrung-docker-tutorial-container-61528

https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run


http://containertutorials.com/volumes/volume_from_image.html

docker build -t php-example .

docker run -it -p 9090:9090 php-example
docker run -d -p 9191:9090 -v /dockershare:/dockershare php-example5

docker exec -it php-example3 /bin/bash

docker build -t php-example5 .
docker run -d -p 9191:9090 -v /dockershare:/dockershare php-example5

docker ps

docker exec -it competent_lamarr /bin/bash


### ---------------------------------------------------------

FROM debian:latest
#FROM debian:sid

RUN apt-get update
RUN apt-get install -y php7.0
#RUN echo "<?php echo ’Hello folks!’;" > /var/index.php

ADD ./index.php /var/index.php
VOLUME /dockershare
WORKDIR /var

CMD ["php", "-S", "0.0.0.0:9090", "-t", "."]

### ---------------------------------------------------------











docker build -t webserver --file webserver.doc .

mkdir www-data
docker run --name webserver --hostname=webserver -d -p 8000:9090 -p 8080:80 -v /dockershare:/dockershare webserver

docker exec -it webserver /bin/bash

docker exec -t webserver service apache2 start

docker stop webserver
docker container start webserver


docker container rm webserver


### VMs


docker ps
#--label

docker ps -a

docker ps -s

docker container ls -a


# stop
docker stop `docker ps -aq`

# remove all
docker rm `docker ps -aq`


docker image ls

# Remove single image
docker rmi image_name:version/image-id

# Remove all image
docker rmi $(docker images -qf "dangling=true")

# Remove all image !!!
docker rmi $(docker images -q)