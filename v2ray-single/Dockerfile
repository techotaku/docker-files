FROM tarot13/v2ray

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN curl -O https://raw.githubusercontent.com/tests-always-included/mo/master/mo && \
    mv mo /usr/local/bin && \
    chmod +x /usr/local/bin/mo && \
    mkdir -p /etc/mo/template && \
    cd / && \
    curl -L -O https://github.com/techotaku/docker-files/raw/master/v2ray-single/entrypoint.sh && \
    chmod +x entrypoint.sh && \
    cd /etc/mo/template && \
    curl -L -O https://github.com/techotaku/docker-files/raw/master/v2ray-single/config.json.template

ENTRYPOINT ["/entrypoint.sh"]