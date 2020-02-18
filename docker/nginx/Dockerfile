FROM nginx:1.15.11-alpine

COPY nginx.conf /etc/nginx/

COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

EXPOSE 80
