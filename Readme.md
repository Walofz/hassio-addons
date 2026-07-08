# Tokiya's Home Assistant Add-ons

คลังจัดเก็บ Custom Add-ons สำหรับ Home Assistant (เน้นระบบ Crypto Full Node, Pool สำหรับ Solo Mining และระบบ Network/Security)

## 📦 Add-ons ที่มีให้บริการ

### Crypto & Mining
* **[Auroracoin Node](auroracoin/)**: ระบบ Full Node พร้อมเปิด ZMQ สำหรับเชื่อมต่อ Miningcore โหลดจาก `ghcr.io/walofz/auroracoin-addon-amd64`
* **[DigiByte Node](digibyte/)**: ระบบ Full Node v8.26.2 พร้อมเปิด ZMQ โหลดจาก `ghcr.io/walofz/digibyte-addon-amd64`
* **[Miningcore](miningcore/)**: ระบบ Mining Pool Software ดึงรายการเหรียญจาก GitHub อัตโนมัติ
* **[Go Solopool](go-solopool/)**: ระบบ Solopool เขียนด้วย Go การทำงานคล้าย ckpool

### Network & Security
* **[Shadowsocks Server](shadowsocks/)**: ระบบ Proxy อุโมงค์ข้อมูลเพื่อความปลอดภัย รองรับการตั้งค่ารหัสผ่านและวิธีเข้ารหัสผ่านหน้า Add-on โหลดจาก `ghcr.io/walofz/shadowsocks-addon-amd64`
* **[Snowflake Proxy](snowflake/)**: ระบบช่วยเชื่อมต่อเครือข่าย Tor สำหรับผู้ใช้ที่ถูกปิดกั้น โหลดจาก `ghcr.io/walofz/snowflake-addon-amd64`

## ⚙️ วิธีการติดตั้ง Repository

1. เปิด Home Assistant ไปที่เมนู **Settings** > **Add-ons** > **Add-on Store**
2. คลิกปุ่ม **จุดสามจุด** (มุมขวาบน) > เลือก **Repositories**
3. นำ URL ของคลังนี้ไปวางในช่อง:
   `https://github.com/walofz/hassio-addons`
4. กด **Add** แล้วปิดหน้าต่าง
5. กดปุ่มจุดสามจุดอีกครั้ง เลือก **Check for updates** 

## 📂 การจัดการไฟล์ข้อมูล (Blockchain, Wallet & Config)

ระบบถูกออกแบบให้เก็บข้อมูลสำคัญไว้ในโฟลเดอร์ `/share` ของ Home Assistant:

* **Auroracoin**: `/share/auroracoin_data/`
* **DigiByte**: `/share/digibyte_data/`
* **Miningcore**: `/share/miningcore_data/`

**วิธีเข้าถึงไฟล์:** ติดตั้ง Add-on **Samba share** เพื่อเปิดโฟลเดอร์ผ่านระบบเครือข่าย

## 🚀 สถาปัตยกรรมที่รองรับ

* `amd64` (ติดตั้งผ่าน Pre-built Image จาก GitHub Container Registry โดยดึงแท็ก `latest` อัตโนมัติ)