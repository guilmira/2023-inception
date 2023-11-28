FROM debian:buster
RUN apt update && apt install -y wordpress
RUN apt install php-fpm php-mysql -y && apt install curl -y

COPY ./script-front.sh /script-front.sh

CMD [ "/script-front.sh" ]