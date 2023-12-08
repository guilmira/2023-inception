FROM alpine:latest
RUN apk update && apk add --no-cache vim
RUN apk add --no-cache build-base


#bindMount command example
#docker run -ti -d -v $(PWD)/hostBM:/contBM whale0

#montar un nginx local.
#docker run -d -p 8080:80 nginx
#el puerto 80 es el que tiene nginx por defecto. lo mapeo al 8080 del host, y accedo a ello a través de localhost:8080

#Convención del puerto HTTP estándar: El puerto 80 es el puerto estándar para el tráfico HTTP. Al mapearlo al puerto 8080 en el host, se permite que las solicitudes HTTP lleguen al contenedor de Nginx a través de un puerto comúnmente utilizado.