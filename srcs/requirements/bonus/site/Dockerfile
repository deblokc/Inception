FROM debian:buster

RUN mkdir -p /inception/site

RUN apt update; apt install -y python3; apt install -y python3-venv; cd /site;\
python3 -m venv venv; /bin/bash -c "source venv/bin/activate";\
apt install -y python3-pip; pip3 install wheel; pip3 install gunicorn flask;

COPY conf.sh /tmp/conf.sh

COPY index.html /inception/site/index.html
COPY index.html /tmp/index.html

ENTRYPOINT ["/tmp/conf.sh"]
