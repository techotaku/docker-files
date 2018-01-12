# Nginx + PHP7-FPM    

## Usage  

```
sudo docker run -d --name webapp \
    -v $HOME/webapp/conf:/etc/nginx/conf.d \
    -v $HOME/webapp/html:/var/www/html \
    -p 80:80/tcp \
    --log-opt max-size=1m \
    --restart=unless-stopped \
    tarot13/nginx-php7
```