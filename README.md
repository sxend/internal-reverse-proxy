
```
export APP_VERSION=<APP_VERSION> && sudo docker run -d -it -p 80:80 -p 443:443 -v $HOME/certs:/usr/local/nginx/certs docker-registry.onplatforms.net/arimit.su/internal-reverse-proxy:${APP_VERSION}
```
