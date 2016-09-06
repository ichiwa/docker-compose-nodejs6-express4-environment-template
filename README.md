# docker-compose-nodejs6-express4-environment-template
My environment for nodejs.

# Installation 

`make install`

After that, execute the following command, 

`docker-compose up --build -d` 

or 

`make up` 

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