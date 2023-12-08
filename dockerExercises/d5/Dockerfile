#First backend created ever miercoles 22 de noviembre 2023
FROM node:19-alpine
COPY package.json /app/
COPY src /app/

WORKDIR /app

RUN npm install

CMD ["node server.js"]