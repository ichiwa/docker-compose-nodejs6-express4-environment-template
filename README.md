# docker-compose-nodejs6-express4-environment-template
My environment for nodejs.

# How to use 
```
user% make install

 ===> Install started...

Host already exists: "default"

 ===> start docker-machine

Starting "default"...
(default) Check network to re-create if needed...
(default) Waiting for an IP...
Machine "default" was started.
Waiting for SSH to be available...
Detecting the provisioner...
Started machines may have new IP addresses. You may need to re-run the `docker-machine env` command.

 ===> docker-machine env default
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/user/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell:
# eval $(docker-machine env default)

user% eval $(docker-machine env default)

user% make start
docker-compose -f docker-compose.yml -p nodejs up -d  --build
Building nodejs_app
Step 1 : FROM mhart/alpine-node:6.5.0
 ---> a5c6aacf93e7
Step 2 : WORKDIR /src
 ---> Using cache
 ---> f35b60942974
Step 3 : RUN apk add --no-cache make gcc g++ python
 ---> Using cache
 ---> 79e71b9daad7
Step 4 : RUN npm install
 ---> Using cache
 ---> 8baa6c0897d7
Step 5 : EXPOSE 3000
 ---> Using cache
 ---> c350fb1d0b29
Step 6 : CMD npm start
 ---> Using cache
 ---> 3ba0494528a3
Successfully built 3ba0494528a3
Starting mysql
Starting memcached
Starting redis
Starting nodejs_app
Starting nginx
```


Test to access [http://192.168.99.100](http://192.168.99.100).

# Docker containers
- Node.js(3000)
- Nginx(reverse proxy 80:3000)
- Redis
- MySQL
- memcached

# Node version
- Node.js  6.5.0
- Express+ECT 4.13.4
