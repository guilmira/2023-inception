FROM debian:buster
WORKDIR /dbDIR
RUN apt update && apt install -y mariadb-server
#ENV	db_name=container-database db_user=guilmira db_pwd=pass
ARG DB_NAME MYSQL_USER MYSQL_PASSWORD MYSQL_ROOT_PASSWORD MYSQL_ADMIN_USER
COPY ./config-files/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


RUN echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> config.sql
RUN echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> config.sql
RUN echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MYSQL_USER}'@'%';" >> config.sql
RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> config.sql

#RUN echo "FLUSH PRIVILEGES;" >> config.sql

RUN	service mysql start 
#RUN mysql < config.sql

CMD ["mysqld"]

#CMD ["service", "mysql", "start"]