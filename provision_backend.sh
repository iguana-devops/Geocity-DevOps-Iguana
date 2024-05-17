#!/bin/bash
set -e

echo "Updating system packages..."
sudo apt update

echo "Installing required packages..."
sudo apt install -y wget tar curl git openjdk-8-jdk postgresql-client-common postgresql-client-12

echo "Setting JAVA_HOME..."
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64' >> ~/.bashrc
source ~/.bashrc

echo "Installing Maven..."
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xvf apache-maven-3.6.3-bin.tar.gz -C /opt/
export M2_HOME=/opt/apache-maven-3.6.3
export MAVEN_HOME=/opt/apache-maven-3.6.3
export PATH=${M2_HOME}/bin:${PATH}
echo 'export M2_HOME=/opt/apache-maven-3.6.3' >> ~/.bashrc
echo 'export MAVEN_HOME=/opt/apache-maven-3.6.3' >> ~/.bashrc
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> ~/.bashrc

echo "Verifying Maven installation..."
mvn -v 

echo "Setting up Tomcat..."
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
sudo tar xf apache-tomcat-9.0.89.tar.gz -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9.0.89 /opt/tomcat/updated
sudo chown -R tomcat: /opt/tomcat/*
sudo sh -c 'chmod +x /opt/tomcat/updated/bin/*.sh'

echo "Configuring Tomcat service..."
cat <<EOF | sudo tee /etc/systemd/system/tomcat9.service
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

echo "Reloading and starting Tomcat..."
sudo systemctl daemon-reload
sudo systemctl start tomcat9
sudo systemctl enable tomcat9

echo "Configuring firewall..."
sudo ufw allow 8080
sudo ufw allow 465

echo "Cloning project repository..."
git clone https://github.com/Iguana2024/Geocity-DevOps-Iguana.git
cd Geocity-DevOps-Iguana

echo "Building project..."
mvn install

echo "Deploying application..."
sudo cp target/citizen.war /opt/tomcat/apache-tomcat-9.0.89/webapps/
sudo systemctl restart tomcat9

echo "Setup completed successfully."
