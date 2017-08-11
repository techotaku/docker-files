FROM haproxy:alpine

MAINTAINER Ian Li <OpenSource@ianli.xyz>

COPY entrypoint.sh /entrypoint.sh

RUN rm /docker-entrypoint.sh && \
    chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]

CMD ["-f", "/usr/local/etc/haproxy/haproxy.cfg"]