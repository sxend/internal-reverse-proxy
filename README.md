
```
sudo docker kill internal-reverse-proxy && \
  sudo docker rm internal-reverse-proxy && \
  sudo docker run --name=internal-reverse-proxy -d -it \
  -p 80:80 -p 443:443 \
  -e HOST_IP=$(ip route get 8.8.8.8 | awk '{ print $NF; exit }') \
  -v $HOME/certs:/usr/local/nginx/certs \
  docker-registry.onplatforms.net/arimit.su/internal-reverse-proxy:<APP_VERSION>
```
