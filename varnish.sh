#!/bin/sh

# runit script

exec /usr/sbin/varnishd -d \
  -f /etc/varnish/default.vcl
