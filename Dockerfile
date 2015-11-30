FROM esepublic/baseimage
MAINTAINER Keith Bentrup <kbentrup@ebay.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes varnish
  apt-get --purge autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
  
EXPOSE 80
