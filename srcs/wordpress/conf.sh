#! /bin/bash

echo "trying to connect to mariadb"

while ! mariadb -hmariadb -u$MARIA_USER -p$MARIA_PW "WordPress" &>/dev/null
do
    sleep 1
done

echo "downloading wordpress..."

mkdir WordPress

cd WordPress; wp core download --allow-root; \
wp config create --dbhost=mariadb --dbname=WordPress --dbuser=$MARIA_USER --dbpass=$MARIA_PW --allow-root; \
wp core install --allow-root --url=$DOMAIN_NAME --title="My Wordpress" --admin_user=$ADMIN_NAME --admin_email="$ADMIN_NAME"@student.42.fr --admin_password=$ADMIN_PW --skip-email;\
wp user create $WP_USER $WP_USER@Imreal.com --user_pass=$WP_PW --role=editor --allow-root;

chown -R www-data:www-data /WordPress
echo "launching php-fpm"

exec /usr/sbin/php-fpm7.4 -F
