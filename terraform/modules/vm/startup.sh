#!/bin/bash

################## DISK ##################

# Create the mount point
sudo mkdir -p /var/lib/jenkins

# Format the disk with ext4 if it is not ext4
FILESYSTEM_TYPE=$(sudo blkid -o value -s TYPE /dev/sdb)
if [ "$FILESYSTEM_TYPE" != "ext4" ]; then 
  sudo mkfs.ext4 /dev/sdb
fi

# Mount the disk
sudo mount /dev/sdb /var/lib/jenkins

# Get the UUID of the disk
UUID=$(sudo blkid -s UUID -o value /dev/sdb)


# Add the mount entry to /etc/fstab if it doesn't already exist
if ! grep -qs "$UUID /jenkins ext4 defaults 0 0" /etc/fstab; then
    echo "UUID=$UUID /jenkins ext4 defaults 0 0" | sudo tee -a /etc/fstab
fi

# Test the /etc/fstab entry without rebooting
mount -a

################## jenkins ##################

sudo apt update
sudo apt install fontconfig openjdk-17-jre -y

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

sudo systemctl stop jenkins

# Ensure the permissions are correct
sudo chown -R jenkins:jenkins /var/lib/jenkins

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins