FROM debian:latest
MAINTAINER Keith Bentrup <kbentrup@magento.com>

COPY varnish-GPG-key.txt /

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes apt-transport-https && \
  apt-key add /varnish-GPG-key.txt && \
  echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes varnish && \
  apt-get --purge autoremove -y apt-transport-https && \
  apt-get clean && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
  
EXPOSE 80

CMD /usr/sbin/varnishd -f /etc/varnish/default.vcl -F
