#! /bin/bash

echo "creating mysql.conf"
cat <<EOF >mysql.conf
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'tnaton'@'localhost' IDENTIFIED BY 'motdepasse';
GRANT ALL PRIVILEGES ON * . * TO 'tnaton'@'localhost';
FLUSH PRIVILEGES;
EOF


echo "launch mysqld"
service mysql start
until mysqladmin -uroot --password="" status &> /dev/null; do sleep 1; done;
sleep 1
echo "executing mysql.conf";
mysql --user=root --password="" <mysql.conf

echo "shutdown of mysql"
mysqladmin --user=root --password="password" shutdown
echo "restarting mysqld"
exec mysqld