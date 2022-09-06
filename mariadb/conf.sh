#! /bin/bash

echo "creating mysql.conf"
cat <<EOF >mysql.conf
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'tnaton'@'%' IDENTIFIED BY 'motdepasse';
CREATE DATABASE WordPress;
GRANT ALL PRIVILEGES ON WordPress.* TO 'tnaton'@'%';
FLUSH PRIVILEGES;
EOF


echo "launch mysqld"
service mysql start
while [ [ ! mysqladmin -uroot --password="" status &> /dev/null ] && [ ! mysqladmin -uroot --password="password" status &> /dev/null ] ] ; do sleep 1; done;
sleep 1
echo "executing mysql.conf";
mysql --user=root --password="" <mysql.conf
echo "shutdown of mysql"
mysqladmin --user=root --password="password" shutdown
echo "restarting mysqld"

exec mysqld
