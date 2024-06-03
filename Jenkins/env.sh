#! /bin/bash

# sudo apt-get install jq -y
DB="$(sudo jq -r '.database_pass' /var/lib/jenkins/workspace/terraform_start/ansible/vars_output.json)"
IP="$(sudo jq -r '.database_private_ip' /var/lib/jenkins/workspace/terraform_start/ansible/vars_output.json )"
sed -i -e "s|192.168.101.30|$IP|g" application.properties
sed -i -e "s|test_password|$DB|g" application.properties
DB=" "
IP=" "
