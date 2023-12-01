FROM debian:buster
ARG DB_NAME MYSQL_USER MYSQL_PASSWORD MYSQL_ROOT_PASSWORD MYSQL_ADMIN_USER
RUN apt update && apt install -y mariadb-server
COPY ./config-files/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> config.sql
RUN echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> config.sql
RUN echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MYSQL_USER}'@'%';" >> config.sql
RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> config.sql
RUN echo "FLUSH PRIVILEGES;" >> config.sql

RUN	service mysql start && mysql < config.sql
CMD ["mysqld"]