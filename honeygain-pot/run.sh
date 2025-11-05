#!/bin/bash

echo "Starting Honeygain Pot Add-on..."

CONFIG_EMAIL=$(jq --raw-output '.email' /data/options.json)
CONFIG_PASSWORD=$(jq --raw-output '.password' /data/options.json)

export HG_EMAIL="${CONFIG_EMAIL}"
export HG_PASSWORD="${CONFIG_PASSWORD}"

echo "Email successfully set: ${HG_EMAIL}"
echo "Password has been set (masked)."

echo "Starting Honeygain Pot application..."
exec node index.js