FROM node:7-onbuild
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN npm install
CMD [ "npm", "start" ]
EXPOSE 8000

