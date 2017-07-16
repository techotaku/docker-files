FROM php:7-fpm-alpine

MAINTAINER Ian Li <OpenSource@ianli.xyz>

RUN apk add --update --no-cache bash nano libpng libmcrypt tzdata autoconf g++ make libjpeg-turbo-dev libwebp-dev  libpng-dev freetype-dev libxpm-dev libmcrypt-dev && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    docker-php-source extract && \
    pecl install redis && \
    docker-php-ext-enable redis && \ 
    docker-php-ext-install exif gd mcrypt mysqli opcache pdo_mysql sockets tokenizer zip && \
    docker-php-source delete && \
    apk del tzdata autoconf g++ make libjpeg-turbo-dev libwebp-dev libpng-dev freetype-dev libxpm-dev libmcrypt-dev && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    rm -rf /var/cache/apk/*

ENV TERM xterm