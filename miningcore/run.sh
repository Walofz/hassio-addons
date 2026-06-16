#!/bin/bash
set -e

DATA_DIR="/share/miningcore_data"

# สร้างโฟลเดอร์ใน /share สำหรับเก็บไฟล์คอนฟิก
mkdir -p "$DATA_DIR"

# หากยังไม่มีไฟล์ config.json ให้ดึงจาก Image มาวาง หรือสร้างโครงสร้าง JSON พื้นฐาน
if [ ! -f "$DATA_DIR/config.json" ]; then
    if [ -f "/app/config.json" ]; then
        cp /app/config.json "$DATA_DIR/config.json"
    else
        echo '{
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
}' > "$DATA_DIR/config.json"
    fi
fi

# ดาวน์โหลดไฟล์ coins.json จาก GitHub เฉพาะครั้งแรกที่ยังไม่มีไฟล์เท่านั้น
if [ ! -f "$DATA_DIR/coins.json" ]; then
    echo "Downloading latest coins.json from repository for the first time..."
    wget -qO "$DATA_DIR/coins.json" https://raw.githubusercontent.com/TheRetroMike/rmt-miningcore/refs/heads/dev/src/Miningcore/coins.json
fi

# ลบไฟล์/Symlink เดิมใน Container และทำ Symbolic Link ไปยังโฟลเดอร์ /share แทน
rm -f /app/config.json
ln -s "$DATA_DIR/config.json" /app/config.json

mkdir -p /app/build
rm -f /app/build/coins.json
ln -s "$DATA_DIR/coins.json" /app/build/coins.json

# สั่งรัน Miningcore
echo "Starting Miningcore..."
cd /app/build
exec dotnet Miningcore.dll -c "$DATA_DIR/config.json"