FROM alpine:latest
CMD exec echo "container de alpine ejecutándose"

#al ser alpine, funcionará con VI, no VIM
CMD apk update && apk add --no-cache vim
# El paquete "build-base" incluye GCC y otras herramientas de compilación necesarias. Alpine Linux está diseñado para ser liviano, y el paquete "build-base" proporciona las herramientas de compilación básicas necesarias para minimizar el tamaño y la complejidad del sistema
RUN apk add --no-cache build-base
