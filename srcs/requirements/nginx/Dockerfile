FROM debian:buster

RUN apt update; apt install -y nginx openssl; mkdir -p /WordPress

COPY tnaton.42.fr /etc/nginx/sites-available/tnaton.42.fr
COPY adminer.42.fr /etc/nginx/sites-available/adminer.42.fr
COPY site.42.fr /etc/nginx/sites-available/site.42.fr

COPY conf.sh /tmp/conf.sh

CMD ["/tmp/conf.sh"]
