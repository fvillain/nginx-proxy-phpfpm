FROM nginx:latest

MAINTAINER Francois Villain "f.villain@linkbynet.com"

COPY config/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html && \
    echo "Welcome to NginX" > /var/www/html/index.html

VOLUME ["/var/www/html"]

EXPOSE 80

ENV FORWARD_TO   localhost
ENV FORWARD_PORT 9000

CMD ["nginx", "-g", "daemon off;"]
