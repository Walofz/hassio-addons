#!/bin/bash

CONFIG_PATH="/data/options.json"

if [ -f "$CONFIG_PATH" ]; then
    export TZ=$(jq --raw-output '.TZ // empty' $CONFIG_PATH)
    export RPC_URL=$(jq --raw-output '.RPC_URL // empty' $CONFIG_PATH)
    export RPC_USER=$(jq --raw-output '.RPC_USER // empty' $CONFIG_PATH)
    export RPC_PASS=$(jq --raw-output '.RPC_PASS // empty' $CONFIG_PATH)
    export ZMQ_URL=$(jq --raw-output '.ZMQ_URL // empty' $CONFIG_PATH)
    export STRATUM_PORT=$(jq --raw-output '.STRATUM_PORT // empty' $CONFIG_PATH)
    export WEB_PORT=$(jq --raw-output '.WEB_PORT // empty' $CONFIG_PATH)    
    export FIXED_DIFF=$(jq --raw-output '.FIXED_DIFF // empty' $CONFIG_PATH)
    export DB_PATH=$(jq --raw-output '.DB_PATH // "/data/soloproxy.db"' $CONFIG_PATH)
    export DISCORD_WEBHOOK_URL=$(jq --raw-output '.DISCORD_WEBHOOK_URL // empty' $CONFIG_PATH)
    export WALLET_ADDRESS=$(jq --raw-output '.WALLET_ADDRESS // empty' $CONFIG_PATH)
fi

DB_DIR=$(dirname "$DB_PATH")
mkdir -p "$DB_DIR"

echo "Starting Solo Proxy via Home Assistant Add-on..."
echo "SQLite DB path: $DB_PATH"
exec ./proxy