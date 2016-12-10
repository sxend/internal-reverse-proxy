FROM sxend/ubuntu:16.04.4

ARG APP_VERSION

ADD ./bootstrap.sh /opt/bootstrap.sh

CMD /opt/bootstrap.sh
