FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server;
RUN test -d /var/run/mysqld || (mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld);

CMD ["mysqld"]
