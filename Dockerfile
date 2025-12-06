# ใช้ Lua 5.4 official image
FROM lua:5.4

# ตั้ง working directory
WORKDIR /app

# คัดลอกไฟล์ทั้งหมดไปที่ container
COPY . /app

# รันสคริป Lua
CMD ["lua", "Pickaxe Simulator.lua"]
