#! /bin/bash

if [ $BONUS ]
then
	mkdir -p /wordpress/adminer;
fi

ln -s /etc/nginx/sites-available/tnaton.42.fr /etc/nginx/sites-enabled/tnaton.42.fr

openssl req -newkey rsa:4096 -sha256 -x509 -nodes -out /etc/ssl/certs/wp.crt -keyout /etc/ssl/private/key.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=tnaton/CN=tnaton.42.fr"; rm /etc/nginx/sites-enabled/default;

exec nginx -g "daemon off;"
