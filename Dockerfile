FROM esepublic/baseimage:0.9.18
MAINTAINER Keith Bentrup <kbentrup@magento.com>

RUN curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes varnish && \
  apt-get --purge autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

COPY default.vcl /etc/varnish/default.vcl

COPY varnish.sh /etc/service/varnish/run
  
EXPOSE 80
