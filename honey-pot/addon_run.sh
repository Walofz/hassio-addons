#!/bin/bash

echo "Starting Add-on Wrapper (addon_run.sh)..."
CONFIG_PATH=/data/options.json

EMAIL_VAL=$(jq --raw-output '.EMAIL' $CONFIG_PATH | xargs)
PASS_VAL=$(jq --raw-output '.PASSWORD' $CONFIG_PATH | xargs)

if [ -z "$EMAIL_VAL" ] || [ "$EMAIL_VAL" == "null" ] || \
   [ -z "$PASS_VAL" ] || [ "$PASS_VAL" == "null" ]; then
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "!!! ERROR: Email or Password not set"
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    exit 1
fi

echo "Configuration loaded. Starting bot for $EMAIL_VAL"

exec env \
    EMAIL="$EMAIL_VAL" \
    PASSWORD="$PASS_VAL" \
    bash /app/run.sh