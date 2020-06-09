#FROM node:7-onbuild
#COPY . /usr/src/app/
#WORKDIR /usr/src/app/
#RUN npm install
#CMD [ "npm", "start" ]
#EXPOSE 8000



FROM node:7.7.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV
ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install && npm cache clean
ONBUILD COPY . /usr/src/app

CMD [ "npm", "start" ]
