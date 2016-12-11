#!/bin/bash

find /usr/local/nginx/conf/ -type f -name '*' | xargs sed -i "s/<HOST_IP>/${HOST_IP}/g"

/opt/prepare_ssl.sh

/usr/local/nginx/sbin/nginx

echo running nginx

tail -f /dev/null
