FROM node:18-alpine

WORKDIR /API_V1

COPY package*.json ./

RUN npm install 

COPY . . 

EXPOSE 3000

CMD ["npm", "start"]


