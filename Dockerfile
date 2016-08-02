FROM debian:jessie
MAINTAINER Keith Bentrup <kbentrup@magento.com>

COPY varnish.gpg /

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes apt-transport-https && \
  apt-key add /varnish.gpg && \
  echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes varnish \
    curl && \
  apt-get --purge autoremove -y apt-transport-https && \
  apt-get clean && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
  
ENTRYPOINT ["/usr/sbin/varnishd", "-F"]

CMD ["-f", "/etc/varnish/default.vcl"]

EXPOSE 80
