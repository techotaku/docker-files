# FRP - Server    

## Usage  

1. [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).  
2. Create your own configuration `~/frps/frps.ini`.  
3. Create container: `sudo docker run -d --name frps -p 17000:7000/tcp -v ~/frps:/etc/frps tarot13/frps -c /etc/frps/frps.ini`.  