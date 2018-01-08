# ShadowsocksR    

## Usage  

```
sudo docker run -d --name shadowsocksr \
    -v $HOME/shadowsocksr:/etc/shadowsocksr \
    -p 443:8188/tcp \
    -e "SSR_API_INTERFACE=mudbjson" \
    --ulimit nofile=512000:1024000 \
    --log-opt max-size=1m \
    --restart=unless-stopped \
    tarot13/shadowsocksr
```

## Useful Env Vars    
* **SSR_API_INTERFACE**: *Required.* Values: `mudbjson` (file `mudb.json` is required) or `sspanelv3ssr` (sql db configuration is required).    
* **SSR_PORT**: *Optional for `sspanelv3ssr`.* Default is `8188`.    
* **SSR_PASSWD**: *Optional for `sspanelv3ssr`.* Single port shared password, default is `rEciTw`.    
* **SSR_METHOD**: *Optional for `sspanelv3ssr`.* Default is `none`.    
* **SSR_PROTOCOL**: *Optional for `sspanelv3ssr`.* Default is `auth_chain_a`.    
* **SSR_OBFS**: *Optional for `sspanelv3ssr`.* Default is `tls1.2_ticket_auth`.    
* **SSR_DB_HOST**: *Required for `sspanelv3ssr`.*    
* **SSR_DB_PORT**: *Optional for `sspanelv3ssr`.* Default is `3306`.    
* **SSR_DB_USER**: *Required for `sspanelv3ssr`.*    
* **SSR_DB_PWD**: *Required for `sspanelv3ssr`.*    
* **SSR_DB_NAME**: *Required for `sspanelv3ssr`.*    
* **SSR_DB_NODE**: *Required for `sspanelv3ssr`.*    
* **SSR_DB_MUL**: *Optional for `sspanelv3ssr`.* Default is `1.0`.    
* **SSR_DB_SSL**: *Optional for `sspanelv3ssr`.* Default is `0`.    
* **SSR_DB_SSL_CA**: *Optional for `sspanelv3ssr`.*    
* **SSR_DB_SSL_CRT**: *Optional for `sspanelv3ssr`.*    
* **SSR_DB_SSL_KEY**: *Optional for `sspanelv3ssr`.*    
