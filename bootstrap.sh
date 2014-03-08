#!/bin/sh

sudo apt-get update
sudo apt-get install -y postgresql-9.1 postgresql-server-dev-9.1 python-dev
sudo apt-get install -y git
sudo apt-get install -y python-pip
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Clone RecordTrac
cd /vagrant
git clone git://github.com/postcode/recordtrac.git
cd recordtrac
git checkout demo
sudo pip install -r requirements.txt
cp .env.example .env
sed -i 's/localhost/testuser\:testpwd\@localhost/g' .env

# Add a new test user and password
: '
sudo -u postgres createuser -P -s -e testuser
sudo -u postgres createdb recordtrac

cd /vagrant/recordtrac
foreman run python db_setup.py
foreman run python db_seed.py
foreman start
'