# Unbound DNS Server    

## Usage  

1. [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).  
2. Create container: `sudo docker run -d --name unbound -p 53:53/tcp -p 53:53/udp -v $HOME/unbuond:/etc/unbound tarot13/unbound`.  