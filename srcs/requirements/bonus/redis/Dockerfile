FROM debian:buster

RUN apt update; apt install -y redis;

COPY conf.sh /tmp/conf.sh

ENTRYPOINT ["/tmp/conf.sh"]
