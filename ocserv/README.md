# Open Connect Server    

## Usage  

1. [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).  
2. Put your `ocserv.conf` and related certificates under `~/ocserv`, then create container: `sudo docker run -d --name ocserv -p 443:443/tcp -p 443:443/udp -v ~/ocserv:/etc/ocserv --cap-add=NET_ADMIN tarot13/ocserv`.  