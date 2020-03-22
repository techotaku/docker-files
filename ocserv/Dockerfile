FROM alpine AS builder

ARG OC_VERSION=1.0.0

RUN apk add --no-cache curl build-base xz linux-headers musl-dev gnutls-dev readline-dev libnl3-dev lz4-dev libseccomp-dev libev-dev geoip-dev protobuf-c-dev talloc-dev http-parser-dev krb5-dev && \
    set -x && \
    cd /root && \
    RADCLI_VERSION=`curl -s "https://github.com/radcli/radcli/releases/latest" | sed -n 's/^.*tag\/\(.*\)".*/\1/p'` && \
    wget https://github.com/radcli/radcli/releases/download/$RADCLI_VERSION/radcli-$RADCLI_VERSION.tar.gz && \
    tar xzf radcli-$RADCLI_VERSION.tar.gz && \
    rm radcli-$RADCLI_VERSION.tar.gz && \
    cd radcli-$RADCLI_VERSION && \
    ./configure && \
    make -j"$(nproc)" && \
    make install && \
    cd /root && \
    wget ftp://ftp.infradead.org/pub/ocserv/ocserv-$OC_VERSION.tar.xz && \
    tar xJf ocserv-$OC_VERSION.tar.xz && \
    rm ocserv-$OC_VERSION.tar.xz && \
    cd ocserv-$OC_VERSION && \
    ./configure && \
    make -j"$(nproc)" && \
    make install

FROM alpine

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

COPY entrypoint.sh /entrypoint.sh
COPY --from=builder /usr/local/lib/libradcli.so.4.3.0 /usr/local/lib/libradcli.so.4.3.0
COPY --from=builder /usr/local/bin/* /usr/local/bin/
COPY --from=builder /usr/local/sbin/* /usr/local/sbin/

RUN apk add --no-cache iptables gnutls readline libseccomp libnl3 http-parser talloc lz4-libs krb5-libs libev protobuf-c geoip && \
    ln -s /usr/local/lib/libradcli.so.4.3.0 /usr/local/lib/libradcli.so.4 && \
    ln -s /usr/local/lib/libradcli.so.4.3.0 /usr/local/lib/libradcli.so && \
    mkdir /var/lib/ocserv && \
    chmod +x /entrypoint.sh

ENV TERM xterm

EXPOSE 443/tcp 443/udp

ENTRYPOINT ["/entrypoint.sh"]
