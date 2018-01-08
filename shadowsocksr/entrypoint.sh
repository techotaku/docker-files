#!/bin/bash

if [ -z "$PUBLIC_IP" ]; then
    export PUBLIC_IP=`curl -s https://ipconfig.io`
fi
echo "[Info] Public IP ${PUBLIC_IP} detected."

export GATEWAY_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
echo "[Info] Gateway IP ${GATEWAY_IP} detected."

cd /root/shadowsocksr-manyuser

export SSR_ENABLE=""

if [ "$SSR_API_INTERFACE" -eq "mudbjson" ] && [ -f "/etc/shadowsocksr/mudb.json" ]; then
    echo "[Info] Api interface mudbjson detected."
    export SSR_ENABLE="TRUE"

    echo "[Info] Linking file \"mudb.json\"..."
    ln -s /etc/shadowsocksr/mudb.json mudb.json
fi

if [ "$SSR_API_INTERFACE" -eq "sspanelv3ssr" ] && [ ! -z "$SSR_DB_HOST" ] && [ ! -z "$SSR_DB_USER" ] && [ ! -z "$SSR_DB_PWD" ] && [ ! -z "$SSR_DB_NAME" ] && [ ! -z "$SSR_DB_NODE" ]; then
    echo "[Info] Api interface sspanelv3ssr detected."
    export SSR_ENABLE="TRUE"

    echo "[Info] Updating connection configuration..."

    if [ -z "$SSR_PORT" ]; then
        export SSR_PORT=8188
    fi

    if [ -z "$SSR_PASSWD" ]; then
        export SSR_PASSWD=rEciTw
    fi

    if [ -z "$SSR_METHOD" ]; then
        export SSR_METHOD=none
    fi

    if [ -z "$SSR_PROTOCOL" ]; then
        export SSR_PROTOCOL=auth_chain_a
    fi

    if [ -z "$SSR_OBFS" ]; then
        export SSR_OBFS=tls1.2_ticket_auth
    fi

    cat /etc/mo/template/user-config.json.template | mo > user-config.json

    echo "[Info] Updating SQL DB configuration..."

    if [ -z "$SSR_DB_PORT" ]; then
        export SSR_DB_PORT=3306
    fi
    if [ -z "$SSR_DB_MUL" ]; then
        export SSR_DB_MUL=1.0
    fi
    if [ -z "$SSR_DB_SSL" ]; then
        export SSR_DB_SSL=0
    fi

    cat /etc/mo/template/usermysql.json.template | mo > usermysql.json
fi

if [ ! -z "$SSR_ENABLE" ]; then
    echo ""
    echo "[Info] Updating general configurations..."

    cat /etc/mo/template/userapiconfig.py.template | mo > userapiconfig.py

    echo "[Info] All configurations updated. Starting service..."
    exec python server.py "$@"
else
    echo ""
    echo "[Error] Can not start service. Please provide SQL DB configuration or \"mudb.json\" file."
fi

