FROM node:14 as angular
WORKDIR /app
COPY . .
RUN npm install
ENTRYPOINT npm run build

FROM httpd:alpine3.15

WORKDIR /usr/local/apache2/htdocs
COPY --from=angular . .