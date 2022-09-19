#! /bin/bash

if [ $BONUS ]
then
	mkdir -p /inception/adminer;
	mkdir -p /inception/site;
	ln -s /etc/nginx/sites-available/adminer.42.fr /etc/nginx/sites-enabled/adminer.42.fr
	ln -s /etc/nginx/sites-available/site.42.fr /etc/nginx/sites-enabled/site.42.fr
else
	rm -rf /inception/adminer &> /dev/null;
	rm -rf /inception/site &> /dev/null;
fi

ln -s /etc/nginx/sites-available/tnaton.42.fr /etc/nginx/sites-enabled/tnaton.42.fr

openssl req -newkey rsa:4096 -sha256 -x509 -nodes -out /etc/ssl/certs/wp.crt -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=tnaton/CN=tnaton.42.fr"; rm /etc/nginx/sites-enabled/default;
openssl req -newkey rsa:4096 -sha256 -x509 -nodes -out /etc/ssl/certs/adminer.crt -keyout /etc/ssl/private/adminerkey.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=tnaton/CN=adminer.42.fr";
openssl req -newkey rsa:4096 -sha256 -x509 -nodes -out /etc/ssl/certs/site.crt -keyout /etc/ssl/private/sitekey.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=tnaton/CN=site.42.fr";

exec nginx -g "daemon off;"
