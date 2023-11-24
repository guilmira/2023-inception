FROM debian:buster
RUN apt-get update && apt-get install -y nginx 
WORKDIR /backendDIR
COPY file.txt fileCopy.txt
#CMD ["nginx", "-g", "daemon off;"]

ENTRYPOINT ["nginx", "-g", "daemon off;"]