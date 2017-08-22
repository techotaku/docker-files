#!/bin/sh

/sbin/syslogd -O /proc/1/fd/1
haproxy "$@"