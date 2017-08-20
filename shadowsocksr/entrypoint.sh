#!/bin/sh

cd /root/shadowsocksr-manyuser

rm -f userapiconfig.py > /dev/null 2>&1
rm -f user-config.json > /dev/null 2>&1
rm -f usermysql.json > /dev/null 2>&1
rm -f mudb.json > /dev/null 2>&1

if [ -f "/etc/shadowsocksr/userapiconfig.py" ]; then
    ln -s /etc/shadowsocksr/userapiconfig.py userapiconfig.py
fi

if [ -f "/etc/shadowsocksr/user-config.json" ]; then
    ln -s /etc/shadowsocksr/user-config.json user-config.json
fi

if [ -f "/etc/shadowsocksr/usermysql.json" ]; then
    ln -s /etc/shadowsocksr/usermysql.json usermysql.jsons
fi

if [ -f "/etc/shadowsocksr/mudb.json" ]; then
    ln -s /etc/shadowsocksr/mudb.json mudb.json
fi

python server.py