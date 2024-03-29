#! /bin/bash

echo "downloading adminer"

mkdir -p /inception/adminer;

cd /inception/adminer; wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php;

cp /inception/adminer/index.php /tmp/index.php

if [ "test -e /inception/adminer/index.php" ]
then
	cp /tmp/index.php /inception/adminer/index.php
fi

chown -R www-data:www-data /inception/adminer

mkdir /run/php

sed -i s/"\/run\/php\/php7.4-fpm.sock"/9000/g  /etc/php/7.4/fpm/pool.d/www.conf

echo "launching php-fpm"

exec /usr/sbin/php-fpm7.4 -F
