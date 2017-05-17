FROM node:6-onbuild
MAINTAINER 991383877@qq.com

ENV HTTP_PORT 8080

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

EXPOSE 8080

CMD ["npm","start"]
