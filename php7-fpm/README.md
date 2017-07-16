# php7-fpm-alpine    

## +Extensions    
* exif  
* gd  
* mcrypt  
* mysqli  
* opcache  
* pdo_mysql  
* redis  
* sockets  
* tokenizer  
* zip  

## Usage
`docker run -d --name php -v ~/www:/www --link mysql:mysql --link redis:redis tarot13/php7-fpm`