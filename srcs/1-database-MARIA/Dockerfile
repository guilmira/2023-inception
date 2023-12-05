FROM debian:buster
ARG DB_NAME MYSQL_ROOT_PASSWORD MYSQL_ROOT_PASSWORD2 MYSQL_ADMIN_USER
RUN apt update && apt install -y mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

RUN echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" > config1.sql
RUN echo "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> config1.sql
RUN echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MYSQL_ADMIN_USER}'@'%';" >> config1.sql
RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';" >> config1.sql
RUN echo "SET PASSWORD FOR '${MYSQL_ADMIN_USER}' = PASSWORD ('${MYSQL_ROOT_PASSWORD2}');" >> config1.sql
RUN echo "FLUSH PRIVILEGES;" >> config1.sql

RUN	service mysql start && mysql < config1.sql
CMD ["mysqld"]

#mysql -u root -p
#show DATABASES;
#SELECT user FROM mysql.user;
#SET PASSWORD FOR 'guilmira' = PASSWORD ('fool');