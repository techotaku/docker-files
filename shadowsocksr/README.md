# ShadowsocksR    

## Usage  

1. [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).  
2. Put your configurations `~/shadowsocksr`, then create container: `sudo docker run -d --name shadowsocksr -p 443:443/tcp -v ~/shadowsocksr:/etc/shadowsocksr tarot13/shadowsocksr`, you can add `--ulimit nofile=512000:1024000` if need.  