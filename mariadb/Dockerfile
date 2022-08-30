FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server;
RUN test -d /var/run/mysqld || (mkdir -p /var/run/mysqld && chmod 0777 /var/run/mysqld && chown mysql:mysql /var/run/mysqld); \
test -d /var/lib/mysql || (mkdir -p /var/lib/mysql; chown mysql:mysql /var/lib/mysql) && \
chmod -R 0777 /var/lib/mysql;
#RUN test -f /var/run/mysqld/mysqld.sock || (touch /var/run/mysqld/mysqld.sock && chmod 777 /var/run/mysqld/mysqld.sock);
COPY conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
