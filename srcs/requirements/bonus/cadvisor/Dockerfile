FROM	debian:buster

RUN		apt-get update && apt-get -y upgrade && apt-get -y install curl

RUN 	curl -L	https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor \
				-o /usr/bin/cadvisor --silent
RUN		chmod +x /usr/bin/cadvisor

CMD	["/usr/bin/cadvisor"]
