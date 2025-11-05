#!/bin/bash

echo "Starting Add-on: Honeygain Pot..."

# นี่คือที่ที่ Home Assistant เก็บค่า Config ที่คุณกรอกใน UI
CONFIG_PATH=/data/options.json

# ใช้ 'jq' อ่านค่าจาก JSON และ Export เป็น Environment Variables
export EMAIL=$(jq --raw-output '.email' $CONFIG_PATH)
export PASSWORD=$(jq --raw-output '.password' $CONFIG_PATH)

# ตรวจสอบว่าค่าไม่ว่าง (กันพลาด)
if [ -z "$EMAIL" ] || [ -z "$PASSWORD" ]; then
    echo "!!!!!!!"
    echo "!!! ERROR: Email หรือ Password ไม่ได้ถูกตั้งค่าในหน้า Configuration"
    echo "!!!!!!!"
    exit 1
fi

echo "Configuration loaded for user: $EMAIL"

# สั่งรัน script 'entrypoint.sh' ตัวเดิมของ Image ต้นฉบับ
# 'exec' จะทำให้ script นี้ทำงานแทนที่ run.sh (เป็นวิธีที่ถูกต้อง)
exec /entrypoint.sh