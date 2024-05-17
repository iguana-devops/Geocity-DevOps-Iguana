#!/bin/bash

# update
sudo apt update

# install wget, tar, curl, git
sudo apt install -y wget tar curl git

#install java 1.8.0
sudo apt install -y openjdk-8-jdk
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64' >> /home/vagrant/.bashrc

#install maven 3.6.3
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xvf apache-maven-3.6.3-bin.tar.gz
mv apache-maven-3.6.3 /opt/

echo 'export M2_HOME=/opt/apache-maven-3.6.3' >> /home/vagrant/.bashrc
echo 'export MAVEN_HOME=/opt/apache-maven-3.6.3' >> /home/vagrant/.bashrc
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /home/vagrant/.bashrc

#install tomcat 9.0.89
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
sudo tar xf apache-tomcat-9.0.89.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.89 /opt/tomcat/updated
sudo chown -R tomcat: /opt/tomcat/*
sudo sh -c 'chmod +x /opt/tomcat/updated/bin/*.sh'

#tomcat 9 service configuration
sudo bash -c 'cat > /etc/systemd/system/tomcat9.service' << EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment="JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64"
Environment="CATALINA_PID=/opt/tomcat/updated/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat/updated/"
Environment="CATALINA_BASE=/opt/tomcat/updated/"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"

ExecStart=/opt/tomcat/updated/bin/startup.sh
ExecStop=/opt/tomcat/updated/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOF
#end tomcat 9 configuration

# reload
sudo systemctl daemon-reload
sudo systemctl start tomcat9
sudo systemctl enable tomcat9

#instal postgresql cient
sudo apt install -y postgresql-client-common
sudo apt install -y postgresql-client-12

#instal node 14
sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

#allow 8080 and 465
sudo ufw allow 8080/tcp
sudo ufw allow 465/tcp

#delete provision
rm -f /tmp/provision_backend.sh