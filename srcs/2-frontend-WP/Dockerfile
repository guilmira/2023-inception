FROM debian:buster
WORKDIR /frontendDIR
RUN apt update && apt install -y wordpress
RUN apt install php-fpm php-mysql -y && apt install curl -y

COPY ./script-front.sh /script/script-front.sh

