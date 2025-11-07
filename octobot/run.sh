#!/bin/bash

echo "Starting OctoBot Addon..."

# กำหนดตำแหน่งที่เราจะเก็บข้อมูลใน /config
CONFIG_PATH="/config/octobot"
USER_DIR="${CONFIG_PATH}/user"
TENTACLES_DIR="${CONFIG_PATH}/tentacles"
LOGS_DIR="${CONFIG_PATH}/logs"

mkdir -p $USER_DIR
mkdir -p $TENTACLES_DIR
mkdir -p $LOGS_DIR

echo "Linking configuration directories..."

ln -sfn $USER_DIR /octobot/user
ln -sfn $TENTACLES_DIR /octobot/tentacles
ln -sfn $LOGS_DIR /octobot/logs

echo "Executing original OctoBot entry-point..."

exec ./docker-entrypoint.sh