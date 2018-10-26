# ShadowsocksR libev client    

## Usage  

1. Put your `config.json` under `~/shadowsocksr`.  
2. Create container: 
```
sudo docker run -d --name shadowsocksr \
    -p 1080:1080/tcp -p 1080:1080/udp \
    -v $HOME/shadowsocksr:/etc/shadowsocksr \
    --ulimit nofile=512000:1024000 \
    --log-opt max-size=200k \
    --restart=unless-stopped \
    tarot13/shadowsocksr ss-local -c /etc/shadowsocksr/config.json -b 0.0.0.0
```