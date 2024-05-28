#!/bin/bash

################## DISK ##################

# Create the mount point
jenkis_config_folder="/var/lib/jenkins"
sudo mkdir -p "$jenkis_config_folder"

# Format the disk with ext4 if it is not ext4
FILESYSTEM_TYPE=$(sudo blkid -o value -s TYPE /dev/sdb)
if [ "$FILESYSTEM_TYPE" != "ext4" ]; then
  sudo mkfs.ext4 /dev/sdb
fi

# Get the UUID of the disk
UUID=$(sudo blkid -s UUID -o value /dev/sdb)
# Set other vars
disk_config_fstab="UUID=$UUID $jenkis_config_folder ext4 defaults 0 0"
fstab_path="/etc/fstab"

# Add the mount entry or if mount is exist - change it, in /etc/fstab with the attached disk
if grep -q "$jenkis_config_folder" "$fstab_path"; then
  sudo sed -i "\|$jenkis_config_folder|c\\$disk_config_fstab" "$fstab_path"
else
  echo "$disk_config_fstab" | sudo tee -a "$fstab_path" > /dev/null
fi

# Test the /etc/fstab entry without rebooting
sudo mount -a

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
