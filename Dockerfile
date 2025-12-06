FROM lua:5.4

WORKDIR /app

COPY . /app

CMD ["lua", "Pickaxe Simulator.lua"]
