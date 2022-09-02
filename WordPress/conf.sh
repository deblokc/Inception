#! /bin/bash

while ! mariadb -hmariadb -utnaton -pmotdepasse "WordPress" &>/dev/null
do
    sleep 1
done

wp core download --allow-root
wp config create --dbhost=mariadb --dbname=WordPress --dbuser=tnaton --dbpass=motdepasse --allow-root

sleep infinity
