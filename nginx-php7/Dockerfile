FROM tarot13/php7-fpm

LABEL maintainer "Ian Li <OpenSource@ianli.xyz>"

RUN apk add --no-cache nginx && \
    sed 's/access_log \/var\/log\/nginx\/access\.log main;/access_log off;/g' -i /etc/nginx/nginx.conf && \
    sed 's/\[::\]:9000/127\.0\.0\.1:9000/g' -i /usr/local/etc/php-fpm.d/zz-docker.conf && \
    RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini && \
    curl -L -O https://github.com/techotaku/docker-files/raw/master/nginx-php7/entrypoint.sh && \
    chmod +x entrypoint.sh && \
    mv entrypoint.sh /

EXPOSE 80/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]