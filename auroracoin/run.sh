#!/bin/bash
set -e

DATA_DIR="/share/auroracoin_data"

mkdir -p "$DATA_DIR"

if [ ! -f "$DATA_DIR/auroracoin.conf" ]; then
    cp /etc/auroracoin.conf "$DATA_DIR/auroracoin.conf"
fi

exec auroracoind -datadir="$DATA_DIR" -printtoconsole