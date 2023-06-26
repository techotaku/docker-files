#!/bin/bash

pushd /etc/xray > /dev/null

declare -a REALITY_DOMAINS=`echo $REALITY_DOMAINS`
declare -a REALITY_UUIDS=`echo $REALITY_UUIDS`
declare -a REALITY_SHORT_IDS=`echo $REALITY_SHORT_IDS`

. mo

TMPFILE=$(mktemp)
mo config.json.template > $TMPFILE
hjson -j $TMPFILE > config.json

popd > /dev/null

echo "[Info] Configuration updated."

exec /usr/local/bin/xray -config /etc/xray/config.json
