FROM debian:buster
RUN apt update && apt install -y nginx openssl
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=SP/L=MA/O=42/OU=student/CN=guilmira.42.fr" -addext "subjectAltName=DNS:guilmira.42.fr"
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=42Madrid, Inc./CN=guilmira.42.fr" -addext "subjectAltName=DNS:guilmira.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

RUN rm -rf /etc/nginx/sites-enabled/*
COPY ./default.conf /etc/nginx/sites-available/default.conf
CMD ["nginx", "-g", "daemon off;"]