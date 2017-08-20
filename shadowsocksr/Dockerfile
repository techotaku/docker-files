FROM python:2-alpine

MAINTAINER Ian Li <OpenSource@ianli.xyz>

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update curl git unzip && \
    cd /root && \
    curl -SL "https://github.com/shadowsocksrr/shadowsocksr/archive/manyuser.zip" -o shadowsocksr.zip && \
    unzip shadowsocksr.zip -d ./ && \
    curl -SL "https://github.com/nakagami/CyMySQL/archive/master.zip"  -o CyMySQL.zip && \
    unzip CyMySQL.zip  -d ./ && \
    mv CyMySQL-master/cymysql/ shadowsocksr-manyuser/ && \
    rm -rf CyMySQL-master && \
    rm CyMySQL.zip shadowsocksr.zip && \
    chmod +x shadowsocksr-manyuser/*.sh  && \
    chmod +x shadowsocksr-manyuser/shadowsocks/*.sh && \
    chmod +x /entrypoint.sh && \
    apk del unzip git && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]