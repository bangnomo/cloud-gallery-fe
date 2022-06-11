FROM node:lts-alpine as build-stage

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# production stage

FROM nginx:stable-alpine as production-stage

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /var/www/*

COPY --from=build-stage /usr/src/app/dist /var/www
EXPOSE 3003

CMD ["nginx", "-g", "daemon off;"]