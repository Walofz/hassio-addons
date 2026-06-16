#!/bin/bash
set -e

# กำหนดให้เก็บข้อมูลบล็อกเชนและ Config ไว้ในโฟลเดอร์ /share/digibyte_data
DATA_DIR="/share/digibyte_data"

mkdir -p "$DATA_DIR"

# หากยังไม่มีไฟล์ config ใน data ให้คัดลอกไฟล์ต้นฉบับไปวาง
if [ ! -f "$DATA_DIR/digibyte.conf" ]; then
    echo "Copying default digibyte.conf to Data Directory..."
    cp /etc/digibyte.conf "$DATA_DIR/digibyte.conf"
fi

echo "Starting DigiByte daemon..."
exec digibyted -datadir="$DATA_DIR" -printtoconsole