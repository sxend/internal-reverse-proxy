
```
docker run -it -p 80:80 -p 443:443 -e HOST_IP=<HOST_IP> -v $HOME/certs:/usr/local/nginx/certs docker-registry.onplatforms.net/arimit.su/internal-reverse-proxy:${APP_VERSION}
```
