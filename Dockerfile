# Base Ubuntu image
FROM ubuntu:22.04

# ติดตั้ง Lua 5.4 และ wget
RUN apt-get update && apt-get install -y lua5.4 wget

# สร้างโฟลเดอร์ /app สำหรับสคริปต์
WORKDIR /app

# คัดลอกไฟล์ทั้งหมดจาก repo ลง /app
COPY . /app

# คำสั่งรันสคริปต์ Lua
CMD ["lua5.4", "Pickaxe Simulator.lua"]
