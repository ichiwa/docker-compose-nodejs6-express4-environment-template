# docker-compose-nodejs6-express4-environment-template
My development environment for nodejs.

# Require
Install [docker-for-mac](https://docs.docker.com/docker-for-mac/).
You don't have to install virtual box.

# How to use 

## Start 
`make start`

Test to access [http://localhost](http://localhost) or [http://localhost:3000](http://localhost:3000). 

## Show logs
`make logs`

## Kill 
`make kill`

# Docker containers
- Node.js(3000)
- Nginx(reverse proxy 80:3000) refer [conf](https://github.com/ichiwa/docker-compose-nodejs6-express4-environment-template/blob/master/docker/etc/nginx/conf.d/nodejs.conf).
- Redis
- MySQL
- memcached

# Node version
- Node.js  6.5.0
- Express+ECT 4.13.4
