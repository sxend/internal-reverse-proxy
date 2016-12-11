#!/bin/bash

prepare() {
  local CERT_DOMAINS="$1"
  local MAIL="$2"
  sed -i "s/<CERT_DOMAINS>/${CERT_DOMAINS}/g" /usr/local/nginx/conf/conf.d/cert.conf.template > /usr/local/nginx/conf/conf.d/cert.conf

  /usr/local/nginx/sbin/nginx

  /opt/certbot-auto certonly -n -a webroot --webroot-path=/usr/local/nginx/html \
    --email ${MAIL} $(echo ${CERT_DOMAINS} | sed 's/\(^\| \)/ -d /g')

  kill $(cat /usr/local/nginx/logs/nginx.pid)
}

prepare "onplatforms.net www.onplatforms.net" "admin@onplatforms.net"

touch /usr/local/nginx/conf/conf.d/cert.conf && \
  mv /usr/local/nginx/conf/conf.d/cert.conf /usr/local/nginx/conf/conf.d/cert.conf.bak

find /usr/local/nginx/conf/ -type f -name '*.ssl' | while read f; do mv "$f" "${f%.ssl}"; done
