FROM debian:buster
#RUN apt update && apt install php-fpm php-mysql mariadb-client curl -y
RUN apt update && apt install -y php7.3 php7.3-mysqli php7.3-fpm wget mariadb-client

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./scriptfront.sh /scriptfront.sh
COPY ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 777 scriptfront.sh
CMD ["./scriptfront.sh"]