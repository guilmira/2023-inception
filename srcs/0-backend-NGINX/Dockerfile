FROM debian:buster
RUN apt update && apt install -y nginx 

WORKDIR /backendDIR
COPY file.txt fileCopy.txt
CMD ["nginx", "-g", "daemon off;"]
