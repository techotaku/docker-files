FROM tarot13/php7-fpm

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN apk add --no-cache nginx && \
    sed 's/no/yes/g' -i /usr/local/etc/php-fpm.d/zz-docker.conf && \
    sed 's/9000/127\.0\.0\.1:9000/g' -i /usr/local/etc/php-fpm.d/zz-docker.conf && \
    echo listen.allowed_clients = 127.0.0.1 >> /usr/local/etc/php-fpm.d/zz-docker.conf && \
    echo opcache.validate_timestamps=0 > /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    mkdir -p /run/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80/tcp

ENTRYPOINT ["php-fpm && nginx"]
