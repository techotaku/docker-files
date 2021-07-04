FROM alpine

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN apk add --no-cache squid

ENTRYPOINT ["/usr/sbin/squid"]

CMD ["-f", "/etc/squid/squid.conf", "-NYCd", "1"]