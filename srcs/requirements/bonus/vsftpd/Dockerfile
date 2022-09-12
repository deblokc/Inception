FROM debian:buster

RUN apt update; apt install -y vsftpd;

COPY conf.sh /tmp/conf.sh

ENTRYPOINT ["/tmp/conf.sh"]
