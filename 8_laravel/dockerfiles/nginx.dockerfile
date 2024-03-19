FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY nginx/nginx.conf .

# RUN mv /etc/nginx/conf.d/nginx.conf /etc/nginx/conf.d/default.conf 
RUN mv nginx.conf default.conf

WORKDIR /var/www/html

COPY src .