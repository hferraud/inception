FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install wget php7.4 php-fpm php-mysql mariadb-client -y

COPY ./config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# install wordpress CLI
RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY ./tools/auto_config.sh /var/


CMD ["bash", "/var/auto_config.sh"]

EXPOSE 9000
