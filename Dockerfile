### STAGE 1: Build ###
# We label our stage as ‘builder’
FROM registry.gitlab.com/cidenet/docker-images/angular-cli:7.3.1 as builder

USER root
RUN mkdir /home/node/app
COPY / /home/node/app/

## Build the angular app in production mode and store the artifacts in dist folder
RUN cd /home/node/app/ && npm install --quiet && ng build --prod

### STAGE 2: Setup ###
FROM nginx:1.15.9-alpine

## Copy our default nginx config
COPY nginx/default.conf /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=builder home/node/app/dist/rumeStore /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
