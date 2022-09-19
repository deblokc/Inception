#! /bin/bash


mkdir -p /inception/site;

if [ ! -e /inception/site/templates/index.html ]
then
	mkdir -p /inception/site/templates;
	cp /tmp/index.html /inception/site/templates/index.html
fi

chown -R www-data:www-data /inception/site

echo "from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/')
def site():
    return render_template(\"index.html\")

if __name__ == \"__main__\":
    app.run(host=\"0.0.0.0\")" > /inception/site/flaskapp.py;

echo "from flaskapp import app
if __name__ == \"__main__\":
    app.run()" > /inception/site/wsgi.py

echo "launching flask"

exec gunicorn --chdir /inception/site --bind 0.0.0.0:5000 --name "site" --timeout 60 --workers 3 wsgi:app
