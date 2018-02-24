# V2Ray Single User    

## Usage  

```
sudo docker run -d --name v2ray \
    -e "V2RAY_UUID=" \
    --log-opt max-size=1m \
    --restart=unless-stopped \
    tarot13/v2ray-single
```

## Useful Env Vars    
* **V2RAY_HTTP_INTERNAL_PORT**: *Optional.* Default is 8080.    
* **V2RAY_UUID**: *Optional.* Default is new generated UUID.    
* **V2RAY_AID**: *Optional.* Default is `32`.    
* **V2RAY_LEVEL**: *Optional.* Default is `1`.    
* **V2RAY_HTTP_WEBSOCKET_PATH**: *Optional.* Default is empty.    
* **V2RAY_DNS**: *Optional.* Default is empty.    
* **V2RAY_RAY_BUFFER_SIZE**: *Optional.* Default is `10`.    