# [Overture](https://github.com/shawn1m/overture) DNS Server    

## Usage  

1. [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).  
2. Create container: `sudo docker run -d --name overture -v $HOME/overture:/etc/overture -p 53:53/tcp -p 53:53/udp tarot13/overture`.  