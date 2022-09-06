#! /bin/bash

echo "trying to connect to mariadb"

while ! mariadb -hmariadb -utnaton -pmotdepasse "WordPress" &>/dev/null
do
    sleep 1
done

echo "downloading wordpress..."

mkdir WordPress

cd WordPress; wp core download --allow-root; \
wp config create --dbhost=mariadb --dbname=WordPress --dbuser=tnaton --dbpass=motdepasse --allow-root; \
wp core install --allow-root --url="tnaton.42.fr" --title="My Wordpress" --admin_user="Tnaton" --admin_email="tnaton@student.42.fr" --admin_password="Admin" --skip-email;\
wp user create TheEditor TheEditor@IExist.com --user_pass=TheEditor --role=editor --allow-root;

chown -R www-data:www-data /WordPress
echo "launching php-fpm"

exec /usr/sbin/php-fpm7.4 -F
