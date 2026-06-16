#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

PASSWORD=$(jq --raw-output '.password' $CONFIG_PATH)
METHOD=$(jq --raw-output '.method' $CONFIG_PATH)
DNS_PROVIDER=$(jq --raw-output '.dns_provider' $CONFIG_PATH)

LOG_LEVEL=$(jq --raw-output '.log_level' $CONFIG_PATH)
export RUST_LOG="shadowsocks=$LOG_LEVEL"

echo "Starting Shadowsocks Server with method: $METHOD and DNS: $DNS_PROVIDER"
if [ "$DNS_PROVIDER" = "system" ]; then
    exec ssserver -s "0.0.0.0:8388" -m "$METHOD" -k "$PASSWORD"
else
    exec ssserver -s "0.0.0.0:8388" -m "$METHOD" -k "$PASSWORD" --dns "$DNS_PROVIDER"
fi