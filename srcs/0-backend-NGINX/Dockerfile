FROM debian:buster
RUN apt-get update \
	&& apt-get install -y openssl \
	&& apt-get install -y nginx
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=CA/ST=QC/O=42Madrid, Inc./CN=guilmira.42.fr" \
	-addext "subjectAltName=DNS:guilmira.42.fr" \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/guilmira.key -out /etc/ssl/certs/guilmira.crt

RUN rm -rf /etc/nginx/sites-enabled/*

PROBAR y hacer funcionar ambas. y si no ya preguntar
#COPY tools/default.conf /etc/nginx/conf.d/
Your volumes will be available in the /home/login/data
COPY ./default.conf /etc/nginx/default.conf
CMD ["nginx", "-g", "daemon off;"]