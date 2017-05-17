FROM daocloud.io/nginx

RUN sudo apt-get update
RUN apt-get install -y nodejs
RUN apt-get install npm

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

EXPOSE 8080

CMD sed -i "s/ContainerID: /ContainerID: "$(hostname)"/g" /usr/src/app/index.html && nginx -g "daemon off;" && npm start
