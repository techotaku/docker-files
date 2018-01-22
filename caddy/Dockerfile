FROM alpine

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN apk add --no-cache bash curl nano ca-certificates && \
    curl https://getcaddy.com | bash -s personal http.jwt,http.login,http.proxyprotocol,http.realip
    
ENTRYPOINT ["/usr/local/bin/caddy"]

["-agree", "-conf", "/etc/Caddyfile", "-log", "stdout", "-root", "/root/webroot"]