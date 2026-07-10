#!/bin/bash
set -e

DATA_DIR="/share/miningcore_data"

if [ -f "/data/options.json" ]; then
    echo "Applying custom hosts from UI configuration..."
    jq -r '.custom_hosts[]?' /data/options.json | while read -r host_entry; do
        if [ -n "$host_entry" ]; then
            echo "$host_entry" >> /etc/hosts
            echo "Added to /etc/hosts: $host_entry"
        fi
    done
fi

mkdir -p "$DATA_DIR"

if [ ! -f "$DATA_DIR/config.json" ]; then
    echo "Generating default config.json..."
    cat <<EOF > "$DATA_DIR/config.json"
{
  "logging": {
    "level": "info",
    "enableConsoleLog": true
  },
  "banning": {
    "manager": "Integrated",
    "banOnJunkReceive": true,
    "banOnInvalidShares": true
  },
  "pools": []
}
EOF
fi

if [ ! -f "$DATA_DIR/coins.json" ]; then
    echo "Downloading latest coins.json..."
    wget -qO "$DATA_DIR/coins.json" https://raw.githubusercontent.com/TheRetroMike/rmt-miningcore/refs/heads/dev/src/Miningcore/coins.json
fi

mkdir -p /app/build
rm -f /app/config.json
rm -f /app/build/coins.json

ln -s "$DATA_DIR/config.json" /app/config.json
ln -s "$DATA_DIR/coins.json" /app/build/coins.json

echo "Starting Miningcore..."
cd /app/build
exec dotnet Miningcore.dll -c "$DATA_DIR/config.json"