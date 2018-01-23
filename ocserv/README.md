# Open Connect Server    

## Usage  

1. Put your `ocserv.conf` and related certificates under `~/ocserv`.  
2. Create container: `sudo docker run -d --name ocserv -p 443:443/tcp -p 443:443/udp -v $HOME/ocserv:/etc/ocserv --cap-add=NET_ADMIN tarot13/ocserv`.  