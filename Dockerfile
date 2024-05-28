# Base image
# FROM ubuntu
FROM node

# Install Node.js on Ubuntu
# RUN apt-get update && apt-get install -y nodejs
# RUN apt-get update
# RUN apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
# RUN apt-get upgrade -y
# RUN apt-get install -y nodejs

# Copy the package code into the container or image
# Format - COPY source destination

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY main.js main.js  
# COPY . .



ENTRYPOINT ["node", "main.js"]

