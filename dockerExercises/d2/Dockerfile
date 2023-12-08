FROM alpine:latest
RUN apk update && apk add --no-cache vim
RUN apk add --no-cache build-base
COPY ./archivoDeCopia.txt .
RUN mv archivoDeCopia.txt nuevoArchivo.txt
RUN touch main.cpp
#CMD echo "bring it on"