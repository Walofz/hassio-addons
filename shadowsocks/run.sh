#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

# ดึงค่าจากหน้าต่าง Configuration
PASSWORD=$(jq --raw-output '.password' $CONFIG_PATH)
METHOD=$(jq --raw-output '.method' $CONFIG_PATH)

# วนลูปอ่านค่า DNS แบบ Multi DNS แล้วสร้างพารามิเตอร์
DNS_ARGS=""
for dns in $(jq -r '.dns_servers[]' $CONFIG_PATH); do
    DNS_ARGS="$DNS_ARGS --dns $dns"
done

#exec ssserver -s "0.0.0.0:8388" -m "$METHOD" -k "$PASSWORD" $DNS_ARGS
exec ssserver --help"