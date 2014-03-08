# Using [Vagrant](http://www.vagrantup.com/) to build [RecordTrac](http://github.com/postcode/recordtrac)

## Installation

### Install Vagrant

Install according to the [Vagrant installation instructions](http://docs.vagrantup.com/v2/installation/index.html).

### Command Line

	git clone https://github.com/vzvenyach/recordtrac-vagrant.git
	cd recordtrac-vagrant
	vagrant init precise64 http://files.vagrantup.com/precise64.box
	vagrant up
	vagrant ssh
	cd /vagrant/recordtrac

	sudo -u postgres createuser -P -s -e testuser
	sudo -u postgres createdb recordtrac
	foreman run python db_setup.py
	foreman run python db_seed.py
	foreman start