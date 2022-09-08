FROM debian:buster

RUN apt update; apt install -y nginx openssl; mkdir -p /WordPress

COPY tnaton.42.fr /etc/nginx/sites-available/tnaton.42.fr

COPY conf.sh /tmp/conf.sh

CMD ["/tmp/conf.sh"]
