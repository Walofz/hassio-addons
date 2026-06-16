# Paitoon's Home Assistant Add-ons

คลังจัดเก็บ Custom Add-ons สำหรับ Home Assistant (เน้นระบบ Crypto Full Node สำหรับ Solo Mining)

## 📦 Add-ons ที่มีให้บริการ

* **[Auroracoin Node](auroracoin/)**: ระบบ Full Node พร้อมเปิด ZMQ สำหรับเชื่อมต่อ Miningcore (พอร์ต: 12341 RPC, 28333 ZMQ)
* **[DigiByte Node](digibyte/)**: ระบบ Full Node v8.26.2 พร้อมเปิด ZMQ (พอร์ต: 9001, 14022 RPC, 28332 ZMQ)

## ⚙️ วิธีการติดตั้ง Repository

1. เปิด Home Assistant ไปที่เมนู **Settings** > **Add-ons** > **Add-on Store**
2. คลิกปุ่ม **จุดสามจุด** (มุมขวาบน) > เลือก **Repositories**
3. นำ URL ของคลังนี้ไปวางในช่อง:
   `https://github.com/<ใส่-username-ของคุณ>/hassio-addons`
4. กด **Add** แล้วปิดหน้าต่าง
5. กดปุ่มจุดสามจุดอีกครั้ง เลือก **Check for updates** (หมวดหมู่ Add-on ใหม่จะปรากฏขึ้นมาด้านล่างสุด)

## 📂 การจัดการไฟล์ข้อมูล (Blockchain & Wallet)

ระบบถูกออกแบบให้เก็บข้อมูลสำคัญไว้ในโฟลเดอร์ `/share` ของ Home Assistant เพื่อป้องกันข้อมูลสูญหายเมื่อทำการรีสตาร์ทหรืออัปเดต:

* **Auroracoin**: `/share/auroracoin_data/`
* **DigiByte**: `/share/digibyte_data/`

**วิธีเข้าถึงไฟล์:** สามารถติดตั้ง Add-on ชื่อ **Samba share** ใน Home Assistant เพื่อเปิดโฟลเดอร์ผ่านระบบเครือข่าย และทำการวางไฟล์ `wallet.dat` หรือแก้ไขไฟล์ `.conf` ได้โดยตรง

## 🚀 สถาปัตยกรรมที่รองรับ

* `amd64` (ติดตั้งรวดเร็วผ่าน Pre-built Image จาก GitHub Container Registry)