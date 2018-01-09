# php7-fpm-alpine    

## +Extensions    
* exif  
* gd  
* igbinary  
* memcached  
* mysqli  
* opcache  
* pdo_mysql  
* redis  
* sockets  
* tokenizer  
* xdebug  
* zip  

## Usage
`docker run -d --name php -v ~/www:/www --link mysql:mysql --link redis:myredis tarot13/php7-fpm`