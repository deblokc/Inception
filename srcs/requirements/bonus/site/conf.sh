#! /bin/bash


mkdir -p /WordPress/site;

if [ "test -e /WordPress/site/index.htlm" ]
then
	cp /tmp/index.html /WordPress/site/index.html
fi

chown -R www-data:www-data /WordPress/site

echo "from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/WordPress/site/')
def site():
    return render_template(\"index.html\")

if __name__ == \"__main__\":
    app.run(host=\"0.0.0.0\")" > /WordPress/site/flaskapp.py;

echo "from flaskapp import app
if __name__ == \"__main__\":
    app.run()" > /WordPress/site/wsgi.py

echo "launching flask"

exec gunicorn --chdir /WordPress/site --bind 0.0.0.0:5000 --name "site_statique" --timeout 60 --workers 3 wsgi:app
