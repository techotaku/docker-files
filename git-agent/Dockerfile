FROM alpine:edge

MAINTAINER Ian Li <OpenSource@ianli.xyz>

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update --no-cache ca-certificates bash git nano wget curl && \
    update-ca-certificates && \
    chmod +x /entrypoint.sh && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]