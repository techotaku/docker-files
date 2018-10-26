FROM alpine

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN apk add --update --no-cache nano musl mbedtls pcre \
    build-base linux-headers musl-dev mbedtls-dev pcre-dev asciidoc xmlto && \
    wget https://github.com/shadowsocksrr/shadowsocksr-libev/archive/master.zip && \
    unzip master.zip && \
    cd shadowsocksr-libev-master && \
    ./configure --with-crypto-library=mbedtls && \
    make && make install && \
    apk del build-base linux-headers musl-dev mbedtls-dev pcre-dev asciidoc xmlto && \
    cd .. && \
    rm master.zip && \
    rm -rf shadowsocksr-libev-master

ENV TERM xterm

EXPOSE 1080/tcp 1080/udp