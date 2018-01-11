FROM tarot13/php7-fpm

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN apk add --no-cache nginx && \
    sed 's/access_log \/var\/log\/nginx\/access\.log main;/access_log off;/g' -i /etc/nginx/nginx.conf && \
    sed 's/\[::\]:9000/127\.0\.0\.1:9000/g' -i /usr/local/etc/php-fpm.d/zz-docker.conf

EXPOSE 80/tcp