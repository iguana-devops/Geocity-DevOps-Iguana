#!/bin/bash

sudo apt install -y wget tar curl
sudo apt install -y git

sudo apt install -y openjdk-8-jdk
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64' >> /home/vagrant/.bashrc

sudo apt install -y maven

echo 'export M2_HOME=/opt/apache-maven-3.6.3' >> /home/vagrant/.bashrc
echo 'export MAVEN_HOME=/opt/apache-maven-3.6.3' >> /home/vagrant/.bashrc
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /home/vagrant/.bashrc

sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
sudo tar xf apache-tomcat-9.0.89.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.89 /opt/tomcat/updated
sudo chown -R tomcat: /opt/tomcat/*
sudo sh -c 'chmod +x /opt/tomcat/updated/bin/*.sh'

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

sudo systemctl daemon-reload
sudo systemctl start tomcat9
sudo systemctl enable tomcat9

sudo apt install -y postgresql-client-common
sudo apt install -y postgresql-client-12

sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
source ~/.bashrc
nvm install 14.21.3

sudo ufw allow 8080/tcp
