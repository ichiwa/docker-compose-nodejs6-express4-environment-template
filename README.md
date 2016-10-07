# docker-compose-nodejs6-express4-environment-template
My development environment for nodejs.

# Require
Install [docker-for-mac](https://docs.docker.com/docker-for-mac/).
You don't have to install virtual box.

# How to use 
```
[master]× »  make start
docker-compose -f docker-compose.yml -p nodejs up -d  --build
Building nodejs_app
Step 1 : FROM mhart/alpine-node:6.5.0
 ---> a5c6aacf93e7
Step 2 : WORKDIR /src
 ---> Using cache
 ---> 8e064a45f141
Step 3 : RUN apk add --no-cache make gcc g++ python
 ---> Using cache
 ---> f56a3fa81657
Step 4 : RUN npm install
 ---> Using cache
 ---> f5f85a3ea0b8
Step 5 : EXPOSE 3000
 ---> Using cache
 ---> fe84eb706ee7
Step 6 : CMD sh -c npm install && npm start
 ---> Using cache
 ---> 62b55451138e
Successfully built 62b55451138e
Starting mysql
Starting memcached
Starting redis
Starting nodejs_app
Starting nginx
```

Test to access [http://localhost](http://localhost) or [http://localhost:3000](http://localhost:3000). 

# Docker containers
- Node.js(3000)
- Nginx(reverse proxy 80:3000) refer [conf](https://github.com/ichiwa/docker-compose-nodejs6-express4-environment-template/blob/master/docker/etc/nginx/conf.d/nodejs.conf).
- Redis
- MySQL
- memcached

# Node version
- Node.js  6.5.0
- Express+ECT 4.13.4
