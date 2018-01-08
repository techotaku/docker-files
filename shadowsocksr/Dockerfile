FROM python:2-alpine

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update bash curl git unzip && \
    cd /root && \
    curl -O https://raw.githubusercontent.com/tests-always-included/mo/master/mo && \
    mv mo /usr/local/bin && \
    chmod +x /usr/local/bin/mo && \
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
    rm -rf /var/cache/apk/* && \
    mkdir -p /etc/mo/template && \
    curl -L https://github.com/techotaku/docker-files/raw/master/shadowsocksr/template/userapiconfig.py.template -o /etc/mo/template/userapiconfig.py.template && \
    curl -L https://github.com/techotaku/docker-files/raw/master/shadowsocksr/template/user-config.json.template -o /etc/mo/template/user-config.json.template && \
    curl -L https://github.com/techotaku/docker-files/raw/master/shadowsocksr/template/usermysql.json.template -o /etc/mo/template/usermysql.json.template

ENTRYPOINT ["/entrypoint.sh"]