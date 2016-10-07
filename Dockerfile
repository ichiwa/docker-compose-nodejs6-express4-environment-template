FROM mhart/alpine-node:6.5.0

WORKDIR /src

RUN apk add --no-cache make gcc g++ python

RUN npm install

EXPOSE 3000

CMD ["sh", "-c", "npm install && npm start"]