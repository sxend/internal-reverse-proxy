#!/bin/bash

APP_VERSION=$1

sudo docker pull docker-registry.onplatforms.net/arimit.su/internal-reverse-proxy:${APP_VERSION}

if [ "$(sudo docker ps -q --filter "NAME=reverse-proxy" | wc -l)" -eq "1" ]; then
  sudo docker kill reverse-proxy
fi

if [ "$(sudo docker ps -a -q --filter "NAME=reverse-proxy" | wc -l)" -eq "1" ]; then
  sudo docker rm reverse-proxy
fi

sudo docker run --name=reverse-proxy -d -it \
  -p 80:80 -p 443:443 \
  -e HOST_IP=$(ip route get 8.8.8.8 | awk '{ print $NF; exit }') \
  docker-registry.onplatforms.net/arimit.su/internal-reverse-proxy:${APP_VERSION}
