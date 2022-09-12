#! /bin/bash


chown -R www-data:www-data /WordPress/site

mkdir /run/php

sed -i s/"\/run\/php\/php7.4-fpm.sock"/9000/g  /etc/php/7.4/fpm/pool.d/www.conf

echo "launching php-fpm"

exec /usr/sbin/php-fpm7.4 -F
