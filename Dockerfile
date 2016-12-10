FROM sxend/ubuntu:16.04.4

ARG APP_VERSION

ENV APP_VERSION=${APP_VERSION}

ENV NGINX_VERSION 1.11.6

RUN wget -O /tmp/nginx-${NGINX_VERSION}.tar.gz http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
    cd /tmp && tar xzf nginx-${NGINX_VERSION}.tar.gz

RUN apt-get -y update && \
    apt-get -y install libssl-dev libpcre3 libpcre3-dev

RUN cd /tmp/nginx-${NGINX_VERSION} && \
    ./configure \
    --with-http_ssl_module \
    --with-http_v2_module && \
    make && \
    make install

ADD ./nginx.conf /usr/local/nginx/conf/nginx.conf

ADD ./bootstrap.sh /opt/bootstrap.sh

CMD /opt/bootstrap.sh
