FROM debian:bullseye

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mariadb start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; \
    CREATE USER IF NOT EXISTS $SQL_USER @'localhost' IDENTIFIED BY '$SQL_PASSWORD'; \
    GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; \
    FLUSH PRIVILEGES;" &&  \
    mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

CMD ["mysqld_safe"]
