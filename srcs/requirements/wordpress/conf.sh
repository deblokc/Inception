#! /bin/bash

echo "trying to connect to mariadb"

while ! mariadb -hmariadb -u$MARIA_USER -p$MARIA_PW "WordPress" &>/dev/null
do
    sleep 1
done

echo "downloading wordpress..."

mkdir WordPress

cd WordPress; wp core download --allow-root &> /dev/null; \
wp config create --dbhost=mariadb --dbname=WordPress --dbuser=$MARIA_USER --dbpass=$MARIA_PW --allow-root &> /dev/null; \
wp core install --allow-root --url=$DOMAIN_NAME --title="My Wordpress" --admin_user=$ADMIN_NAME --admin_email="$ADMIN_NAME"@student.42.fr --admin_password=$ADMIN_PW --skip-email &> /dev/null;\
wp user create $WP_USER $WP_USER@Imreal.com --user_pass=$WP_PW --role=editor --allow-root &> /dev/null;

chown -R www-data:www-data /WordPress

if [ $BONUS ]
then
	cd /WordPress;\
	echo "Downloading redis plugin";\
	wp plugin install redis-cache --activate --allow-root &> /dev/null;\
	sed -i s/"<?php"/"<?php\ndefine('WP_REDIS_HOST','redis');\ndefine( 'WP_REDIS_PASSWORD', '$REDIS_PW' );"/g /WordPress/wp-config.php ;\
	echo "redis is installed";\
	wp redis enable --allow-root &> /dev/null;
else
	cd /WordPress;\
	wp plugin deactivate redis-cache --uninstall --allow-root &> /dev/null;
fi

echo "launching php-fpm"

exec /usr/sbin/php-fpm7.4 -F
