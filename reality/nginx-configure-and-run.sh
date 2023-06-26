#!/bin/bash

pushd /opt/bitnami/nginx/conf > /dev/null

mo nginx.conf.template > nginx.conf

popd > /dev/null

echo "[Info] Configuration updated."

exec /opt/bitnami/scripts/nginx/entrypoint.sh /opt/bitnami/scripts/nginx/run.sh
