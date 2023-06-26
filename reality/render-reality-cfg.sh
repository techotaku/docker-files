#!/bin/bash

pushd /etc/xray

declare -a REALITY_DOMAINS=`echo $REALITY_DOMAINS`
declare -a REALITY_UUIDS=`echo $REALITY_UUIDS`
declare -a REALITY_SHORT_IDS=`echo $REALITY_SHORT_IDS`

. mo
mo config.json.template > config.json
hjson -j < config.json > config.json

popd

echo "[Info] Configuration updated."
