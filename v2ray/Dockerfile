FROM alpine

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

ARG V2RAY_VER=4.13.0

RUN apk add --no-cache bash curl nano ca-certificates && \
    curl -L "https://github.com/v2ray/v2ray-core/releases/download/v${V2RAY_VER}/v2ray-linux-64.zip" -o /tmp/v2ray.zip && \
    mkdir -p /tmp/v2ray && \
    unzip /tmp/v2ray.zip -d /tmp/v2ray/ && \
    mv /tmp/v2ray/v2ray /usr/local/bin/v2ray && \
    mv /tmp/v2ray/v2ctl /usr/local/bin/v2ctl && \
    mv /tmp/v2ray/geoip.dat /usr/local/bin/geoip.dat && \
    mv /tmp/v2ray/geosite.dat /usr/local/bin/geosite.dat && \
    chmod +x /usr/local/bin/v2ray && \
    chmod +x /usr/local/bin/v2ctl && \
    rm -rf /tmp/v2ray && \
    curl -O https://raw.githubusercontent.com/tests-always-included/mo/master/mo && \
    mv mo /usr/local/bin && \
    chmod +x /usr/local/bin/mo

ENTRYPOINT ["/usr/local/bin/v2ray"]

CMD ["-config", "/etc/v2ray/config.json"]
