#!/bin/bash
set -e

DATA_DIR="/share/miningcore_data"

# 1. สร้างโฟลเดอร์เก็บข้อมูลหลัก (ถ้ายังไม่มี)
mkdir -p "$DATA_DIR"

# 2. สร้างไฟล์ config.json พื้นฐาน (ถ้ายังไม่มี)
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

# 3. ดาวน์โหลดไฟล์ coins.json (ถ้ายังไม่มี)
if [ ! -f "$DATA_DIR/coins.json" ]; then
    echo "Downloading latest coins.json..."
    wget -qO "$DATA_DIR/coins.json" https://raw.githubusercontent.com/TheRetroMike/rmt-miningcore/refs/heads/dev/src/Miningcore/coins.json
fi

# 4. เตรียมโฟลเดอร์และลบไฟล์เดิมใน Container ทิ้ง
mkdir -p /app/build
rm -f /app/config.json
rm -f /app/build/coins.json

# 5. ทำ Symbolic Link โยงจาก /share กลับเข้าไปใน Container
ln -s "$DATA_DIR/config.json" /app/config.json
ln -s "$DATA_DIR/coins.json" /app/build/coins.json

# 6. สั่งรัน Miningcore
echo "Starting Miningcore..."
cd /app/build
exec dotnet Miningcore.dll -c "$DATA_DIR/config.json"