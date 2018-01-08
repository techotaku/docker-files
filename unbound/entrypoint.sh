#!/bin/ash

/usr/sbin/unbound-anchor -a /etc/unbound/root.key
/usr/sbin/unbound -d "$@"