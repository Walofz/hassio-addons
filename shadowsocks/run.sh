#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

# ดึงค่าจากหน้าต่าง Configuration
PASSWORD=$(jq --raw-output '.password' $CONFIG_PATH)
METHOD=$(jq --raw-output '.method' $CONFIG_PATH)
DNS_PROVIDER=$(jq --raw-output '.dns_provider' $CONFIG_PATH)

echo "Starting Shadowsocks Server with method: $METHOD and DNS: $DNS_PROVIDER"

# ตรวจสอบเงื่อนไข: ถ้าเลือก system ไม่ต้องใส่พารามิเตอร์ --dns (ปล่อยให้ระบบจัดการเอง)
if [ "$DNS_PROVIDER" = "system" ]; then
    exec ssserver -s "0.0.0.0:8388" -m "$METHOD" -k "$PASSWORD"
else
    exec ssserver -s "0.0.0.0:8388" -m "$METHOD" -k "$PASSWORD" --dns "$DNS_PROVIDER"
fi