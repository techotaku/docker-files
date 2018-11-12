# FRP - Client    

## Usage  

1. [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).  
2. Create your own configuration `~/frpc/frpc.ini`.  
3. Create container: `sudo docker run -d --name frpc -v ~/frpc:/etc/frpc tarot13/frpc -c /etc/frpc/frpc.ini`.  