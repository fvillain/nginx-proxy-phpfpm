FROM nginx:latest

MAINTAINER Francois Villain "f.villain@linkbynet.com"

COPY config/etc/nginx/conf.d/default.conf.tpl /etc/nginx/conf.d/default.conf.tpl

RUN mkdir -p /var/www/html && \
    echo "Welcome to NginX" > /var/www/html/index.html

VOLUME ["/var/www/html"]

EXPOSE 80

ENV FORWARD_TO   localhost
ENV FORWARD_PORT 9000

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
