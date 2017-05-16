FROM node:6-onbuild
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app
ENV PORT 80
EXPOSE 8080
ENTRYPOINT node build/dev-server.js