FROM debian:buster
RUN apt update && apt install -y openssl nginx

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=42Madrid, Inc./CN=guilmira.42.fr" -addext "subjectAltName=DNS:guilmira.42.fr" -newkey rsa:2048 -keyout /etc/nginx/ssl/guilmira.key -out /etc/nginx/ssl/guilmira.crt

RUN rm -rf /etc/nginx/sites-enabled/*
COPY ./default.conf /etc/nginx/default.conf
CMD ["tail", "-f", "/dev/null"]
#CMD ["nginx", "-g", "daemon off;"]
#COPY tools/default.conf /etc/nginx/conf.d/