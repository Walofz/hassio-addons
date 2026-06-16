FROM ubuntu:22.04

# ติดตั้งคลังเครื่องมือที่จำเป็น
RUN apt-get update && apt-get install -y \
    wget \
    libssl3 \
    libevent-2.1-7 \
    libevent-pthreads-2.1-7 \
    libboost-system1.74.0 \
    libboost-filesystem1.74.0 \
    libboost-thread1.74.0 \
    libsqlite3-0 \
    libzmq5 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# ดาวน์โหลดและแตกไฟล์ Pre-compiled จาก GitHub Releases ของ DigiByte
RUN wget https://github.com/DigiByte-Core/digibyte/releases/download/v8.26.2/digibyte-8.26.2-x86_64-linux-gnu.tar.gz \
    && tar -xzvf digibyte-8.26.2-x86_64-linux-gnu.tar.gz \
    && cp -r digibyte-8.26.2/bin/* /usr/local/bin/ \
    && rm -rf digibyte-8.26.2*

# คัดลอกสคริปต์และคอนฟิกเข้าไปใน Image
COPY digibyte.conf /etc/digibyte.conf
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# เปิดพอร์ต RPC และ ZMQ
EXPOSE 14022 28332 9001

# รันผ่าน Entrypoint Script ของ HA Add-on
CMD [ "/run.sh" ]