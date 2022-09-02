FROM debian:buster

RUN apt-get update; apt-get install -y curl mariadb-client php-mysql wget; curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; apt-get install -y php; chmod +x wp-cli.phar; mv wp-cli.phar /usr/local/bin/wp

RUN apt-get install -y php7.4-fpm

COPY conf.sh /tmp/conf.sh

ENTRYPOINT ["sh", "/tmp/conf.sh"]
