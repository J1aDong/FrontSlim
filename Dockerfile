FROM daocloud.io/nginx

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
RUN install node

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app

EXPOSE 8080

CMD sed -i "s/ContainerID: /ContainerID: "$(hostname)"/g" /usr/src/app/index.html && nginx -g "daemon off;" && npm start
