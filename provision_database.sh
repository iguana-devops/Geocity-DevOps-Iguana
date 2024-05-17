#!/bin/bash
#update
sudo apt update

#install wget, ca-certificates
sudo apt install -y wget ca-certificates

#install postgresql
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

sudo apt install -y postgresql postgresql-contrib

#configure postgresql
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/12/main/postgresql.conf
sudo sh -c "echo 'host	all         	all         	0.0.0.0/0           	md5' >> /etc/postgresql/12/main/pg_hba.conf"

sudo systemctl restart postgresql
PG_PASSWORD=$(</tmp/pg_password.txt)
sudo -u postgres psql -c "CREATE USER postgres WITH PASSWORD '$PG_PASSWORD';"
sudo -u postgres psql -c "CREATE DATABASE ss_demo_1 OWNER postgres;"

echo "host	ss_demo_1	postgres 	0.0.0.0/0	md5" | sudo tee -a /etc/postgresql/12/main/pg_hba.conf

#reload
sudo systemctl reload postgresql

#allow 5432
sudo ufw allow 5432/tcp

#delete password and provision
rm -f /tmp/pg_password.txt
rm -f /tmp/provision_database.sh
