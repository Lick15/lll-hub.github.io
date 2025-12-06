# ใช้ Lua 5.4 official image
FROM lua:5.4

# สร้าง folder สำหรับ project
WORKDIR /app

# คัดลอกทุกไฟล์ไป container
COPY . /app

# รัน Lua script ของคุณ
CMD ["lua", "Pickaxe Simulator.lua"]
