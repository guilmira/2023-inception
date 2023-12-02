FROM debian:buster
RUN apt update && apt install php-fpm php-mysql curl mariadb-client -y

#instalar CLI y darle permisos. fundamental para configurar WP de manera "sencilla"
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./scriptfront.sh /scriptfront.sh
COPY ./scriptfront.sh /etc/php/7.3/fpm/pool.d


RUN chmod 777 scriptfront.sh
#CMD ["tail", "-f", "/dev/null"]
CMD ["./scriptfront.sh"]
