FROM php:7-fpm-alpine

MAINTAINER Ian Li <OpenSource@ianli.xyz>

RUN apk add --update --no-cache bash musl nano libpng libmcrypt libmemcached freetype libjpeg-turbo libpng libwebp libxpm \
    tzdata autoconf g++ make libmemcached-dev libjpeg-turbo-dev libwebp-dev libpng-dev freetype-dev libxpm-dev libmcrypt-dev && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd && \
    docker-php-source extract && \
    pecl install redis && \
    pecl install xdebug && \
    pecl install memcached && \
    docker-php-ext-enable redis xdebug memcached && \ 
    docker-php-ext-install exif mcrypt mysqli opcache pdo_mysql sockets tokenizer zip && \
    docker-php-source delete && \
    apk del tzdata autoconf g++ make libmemcached-dev libjpeg-turbo-dev libwebp-dev libpng-dev freetype-dev libxpm-dev libmcrypt-dev && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    rm -rf /var/cache/apk/*

ENV TERM xterm