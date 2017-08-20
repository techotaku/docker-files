FROM alpine:3.6

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update --no-cache curl wget ca-certificates libcap && \
    update-ca-certificates && \
    mkdir -p /usr/bin && \
    cd /usr/bin && \
    wget -qO- https://github.com/chenhw2/google-https-dns/releases/download/v20170715/google-https-dns_linux-amd64-20170715.tar.gz | tar xz && \
    mv google-https-dns_* google-https-dns && \
    setcap CAP_NET_BIND_SERVICE=+eip /usr/bin/google-https-dns && \
    apk del libcap && \
    rm -rf /var/cache/apk/* && \
    chmod +x /entrypoint.sh

USER nobody

ENTRYPOINT ["/entrypoint.sh"]