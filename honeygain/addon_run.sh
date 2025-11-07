#!/bin/bash
# /addons/honeygain/addon_run.sh

echo "[Honeygain Addon] Starting..."

CONFIG_PATH=/data/options.json

EMAIL=$(jq --raw-output '.EMAIL' $CONFIG_PATH)
PASSWORD=$(jq --raw-output '.PASSWORD' $CONFIG_PATH)
DEVICE_NAME=$(jq --raw-output '.DEVICES' $CONFIG_PATH)

if [ -z "$EMAIL" ] || [ -z "$PASSWORD" ] || [ -z "$DEVICE_NAME" ]; then
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "!!! ERROR: Email or Password or Device not set"
    echo "!!! Please configure the addon before starting."
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    exit 1
fi

echo "[Honeygain Addon] Configuration loaded."
echo "[Honeygain Addon] Device Name: $DEVICE_NAME"
echo "[Honeygain Addon] Accepting Terms of Use and starting Honeygain..."

exec /app/honeygain \
    -tou-accept \
    -email "$EMAIL" \
    -pass "$PASSWORD" \
    -device "$DEVICE_NAME"