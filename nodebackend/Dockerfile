FROM node:12

WORKDIR /app

COPY *.json ./

RUN npm install

COPY . .

CMD [ "npm", "start" ]