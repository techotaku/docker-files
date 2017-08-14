FROM alpine:3.6

MAINTAINER Ian Li <OpenSource@ianli.xyz>

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update --no-cache bash git nano && \
    chmod +x /entrypoint.sh && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]