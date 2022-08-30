FROM debian:buster

RUN apt-get update; apt-get install -y curl; curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; apt-get install -y php; chmod +x wp-cli.phar; mv wp-cli.phar /usr/local/bin/wp

#Will be config script
RUN wp core download --allow-root
RUN wp config create --dbname=mariadb --dbuser=tnatonwordpress --dbpass=motdepasse --allow-root

ENTRYPOINT ["sleep", "infinity"]
