FROM alpine:3.6

MAINTAINER Ian Li <OpenSource@ianli.xyz>

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update nano iptables \
    musl openssl gnutls readline libnl3 lz4 lz4-libs libseccomp libev geoip \
    build-base xz linux-headers musl-dev gnutls-dev readline-dev libnl3-dev lz4-dev libseccomp-dev libev-dev geoip-dev && \
    set -x && \
    cd /root && \
    wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.11.8.tar.xz && \
    tar xJf ocserv-0.11.8.tar.xz && \
    rm ocserv-0.11.8.tar.xz && \
    cd ocserv-0.11.8 && \
    ./configure && \
    make -j"$(nproc)" && \
    make install && \
    cd /root && \
    rm -rf ocserv-0.11.8 && \
    apk del build-base xz linux-headers musl-dev gnutls-dev readline-dev libnl3-dev lz4-dev libseccomp-dev libev-dev geoip-dev && \
    rm -rf /var/cache/apk/* && \
    mkdir /var/lib/ocserv && \
    chmod +x /entrypoint.sh

ENV TERM xterm

EXPOSE 443/tcp 443/udp

ENTRYPOINT ["/entrypoint.sh"]