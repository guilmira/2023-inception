FROM debian:buster
RUN apt update && apt install -y wordpress
RUN apt install php-fpm php-mysql -y && apt install curl -y

#instalar CLI y darle permisos. fundamental para configurar WP de manera "sencilla"
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./script-front.sh /script-front.sh

CMD [ "/script-front.sh" ]