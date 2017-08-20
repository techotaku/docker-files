# Google HTTPS DNS Proxy    

## Usage  

1. [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).  
2. Create container: `sudo docker run -d --name dns -p 5300:53/tcp tarot13/google-https-dns --edns 0.0.0.0/0`, use your **own local subnet** (usually assigned by your ISP) to replace `0.0.0.0/0`.  