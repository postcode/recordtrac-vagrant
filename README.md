# Using [Vagrant](http://www.vagrantup.com/) to build [RecordTrac](http://github.com/postcode/recordtrac)

## Installation

### Install Vagrant

Install according to the [Vagrant installation instructions](http://docs.vagrantup.com/v2/installation/index.html).

### Command Line

	git clone https://github.com/vzvenyach/recordtrac-vagrant.git
	cd recordtrac-vagrant
	vagrant up
	vagrant ssh
	cd /vagrant/recordtrac
	sudo -u postgres createuser -P -s -e testuser

Here, it will prompt you to enter a password and confirm the password. The test password is "testpwd". Then, keep going...

	sudo -u postgres createdb recordtrac
	foreman run python db_setup.py
	foreman run python db_seed.py
	foreman start

### Go to the browser

	http://localhost:8080