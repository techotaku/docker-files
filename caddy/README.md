# Caddy Server    

## Usage  
1. Create container: `sudo docker run -d --name caddy -p 80:80/tcp -p 443:443/tcp -v $HOME/Caddyfile:/etc/Caddyfile -v $HOME/webroot:/root/webroot tarot13/caddy`