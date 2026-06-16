#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

# ดึงค่าจากหน้าต่าง Configuration ของ Add-on
PASSWORD=$(jq --raw-output '.password' $CONFIG_PATH)
METHOD=$(jq --raw-output '.method' $CONFIG_PATH)

echo "Starting Shadowsocks Server with method: $METHOD"
exec ssserver -s "0.0.0.0:8388" -m "$METHOD" -k "$PASSWORD"