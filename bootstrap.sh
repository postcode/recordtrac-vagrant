#!/bin/sh

sudo apt-get update
sudo apt-get install -y postgresql-9.1 postgresql-server-dev-9.1 python-dev
sudo apt-get install -y git
sudo apt-get install -y python-pip
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Clone RecordTrac
cd /vagrant
git clone https://github.com/postcode/recordtrac.git
cd recordtrac
sudo pip install -r requirements.txt
cp .env.example .env
sed -i 's/localhost/testuser\:testpwd\@localhost/g' .env