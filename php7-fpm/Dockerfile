FROM php:fpm-alpine

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN apk add --no-cache bash cyrus-sasl freetype icu libbz2 libjpeg-turbo libmemcached libpng libwebp libxml2 libxpm libzip musl nano oniguruma openssl \
    tzdata autoconf g++ make bzip2-dev cyrus-sasl-dev freetype-dev icu-dev libjpeg-turbo-dev libmemcached-dev libpng-dev libwebp-dev libxml2-dev libxpm-dev libzip-dev oniguruma-dev openssl-dev && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    docker-php-source extract && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) openssl || ( mv /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 && docker-php-ext-install openssl ) && \
    docker-php-ext-install -j$(nproc) bz2 ctype exif fileinfo gd iconv intl json mbstring mysqli opcache openssl pdo pdo_mysql soap sockets tokenizer xml zip && \
    pecl install -o -f igbinary redis memcached && \
    docker-php-ext-enable igbinary redis memcached && \ 
    docker-php-source delete && \
    apk del tzdata autoconf g++ make bzip2-dev cyrus-sasl-dev freetype-dev icu-dev libjpeg-turbo-dev libmemcached-dev libpng-dev libwebp-dev libxml2-dev libxpm-dev libzip-dev oniguruma-dev openssl-dev && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer