FROM node:14

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]

# Создание Docker образа
# docker build -t hello-world-node .
# Запуск контейнера
# docker run -p 3000:3000 hello-world-node