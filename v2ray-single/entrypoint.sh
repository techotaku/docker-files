#!/bin/bash

#export V2RAY_RAY_BUFFER_SIZE=1

if [ -z "$V2RAY_AID" ]; then
    export V2RAY_AID=32
fi

if [ -z "$V2RAY_LEVEL" ]; then
    export V2RAY_LEVEL=1
fi

if [ -z "$V2RAY_UUID"]; then
    export V2RAY_UUID=`cat /proc/sys/kernel/random/uuid`
    echo "New UUID generated: ${V2RAY_UUID}."
fi

echo "Updating V2Ray configurations..."
mkdir -p /etc/v2ray
cat /etc/mo/template/config.json.template | mo > /etc/v2ray/config.json

echo "All configurations updated. Starting services..."

/usr/local/bin/v2ray -config /etc/v2ray/config.json "$@"