# use a node base image
FROM node:7-onbuild

# set maintainer
#LABEL maintainer "academy@release.works"
#COPY . /usr/src/app
#WORKDIR /usr/src/app
#RUN npm install

# set a health check
#HEALTHCHECK --interval=5s \
#            --timeout=5s \
#            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
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
