# php7-fpm-alpine    

## +Extensions    
* bz2
* ctype
* exif
* fileinfo
* gd
* iconv
* igbinary
* intl
* json
* mbstring
* memcached
* mysqli
* opcache
* openssl
* pdo
* pdo_mysql
* redis
* soap
* sockets
* tokenizer
* xml
* zip

## Usage
`docker run -d --name php -v ~/www:/www --link mysql:mysql --link redis:myredis tarot13/php7-fpm`