#!/bin/sh

# runit script

exec /usr/sbin/varnishd \
  -f /etc/varnish/default.vcl \
  -a :80
