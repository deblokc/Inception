#! /bin/bash

echo "creating mysql.conf"
cat <<EOF >mysql.conf
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIA_ROOT_PW';
CREATE USER '$MARIA_USER'@'%' IDENTIFIED BY '$MARIA_PW';
CREATE DATABASE WordPress;
GRANT ALL PRIVILEGES ON WordPress.* TO '$MARIA_USER'@'%';
FLUSH PRIVILEGES;
EOF


echo "launch mysqld"
service mysql start
while [ [ ! mysqladmin -uroot --password="" status &> /dev/null ] && [ ! mysqladmin -uroot --password="$MARIA_ROOT_PW" status &> /dev/null ] ] ; do sleep 1; done;
sleep 1
echo "executing mysql.conf";
mysql --user=root --password="" <mysql.conf
echo "shutdown of mysql"
mysqladmin --user=root --password="$MARIA_ROOT_PW" shutdown
echo "restarting mysqld"

exec mysqld
