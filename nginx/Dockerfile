FROM debian:buster

RUN apt update; apt install -y nginx openssl; mkdir -p /WordPress

COPY tnaton.42.fr /etc/nginx/sites-available/tnaton.42.fr

RUN ln -s /etc/nginx/sites-available/tnaton.42.fr /etc/nginx/sites-enabled/tnaton.42.fr

RUN openssl req -newkey rsa:4096 -sha256 -x509 -nodes -out /etc/ssl/certs/wp.crt -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=tnaton/CN=tnaton.42.fr"; rm /etc/nginx/sites-enabled/default;

CMD ["nginx", "-g", "daemon off;"]
