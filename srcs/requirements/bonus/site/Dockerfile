FROM debian:buster

RUN mkdir -p /WordPress/site

RUN apt update; apt install -y python3; apt install -y python3-venv; cd /WordPress/site;\
python3 -m venv venv; /bin/bash -c "source venv/bin/activate";\
apt install -y python3-pip; pip3 install wheel; pip3 install gunicorn flask;

COPY conf.sh /tmp/conf.sh

COPY index.html /WordPress/site/index.html
COPY index.html /tmp/index.html

ENTRYPOINT ["/tmp/conf.sh"]
