FROM node:21.5.0

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --omit=dev
COPY ./src ./src
COPY ./videos ./videos

CMD npm start