#!/bin/bash

sudo apt update
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

sudo apt install postgresql-client -y