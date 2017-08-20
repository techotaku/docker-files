# Docker

* **[Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)**.    
* **Reload Daemon**: `kill -SIGHUP $(pidof dockerd)`.    
* **Live Restore**: `{ "live-restore": true }` in `/etc/docker/daemon.json`.    
* **Less Log**: `--log-opt max-size=1m`.    
* **Update Restart Policy**: `docker update --restart=unless-stopped <CONTAINER>`.    
* **Reload Container**: `docker kill -s HUP <CONTAINER>` (not all container accept this).    
