#!/bin/bash

################## DISK ##################

# Create the mount point
jfrog_config_folder="/opt/jfrog"
sudo mkdir -p "$jfrog_config_folder"

# Format the disk with ext4 if it is not ext4
FILESYSTEM_TYPE=$(sudo blkid -o value -s TYPE /dev/sdb)
if [ "$FILESYSTEM_TYPE" != "ext4" ]; then
  sudo mkfs.ext4 /dev/sdb
fi

# Get the UUID of the disk
UUID=$(sudo blkid -s UUID -o value /dev/sdb)
# Set other vars
disk_config_fstab="UUID=$UUID $jfrog_config_folder ext4 defaults 0 0"
fstab_path="/etc/fstab"

# Add the mount entry or if mount is exist - change it, in /etc/fstab with the attached disk
if grep -q "$jfrog_config_folder" "$fstab_path"; then
  sudo sed -i "\|$jfrog_config_folder|c\\$disk_config_fstab" "$fstab_path"
else
  echo "$disk_config_fstab" | sudo tee -a "$fstab_path" > /dev/null
fi

# Test the /etc/fstab entry without rebooting
sudo mount -a

################## jfrog ##################


# install docker
sudo apt update
sudo apt-get install ca-certificates curl nginx -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker $USER

#install jfrog artifactory
export JFROG_HOME=/opt/jfrog
sudo mkdir -p $JFROG_HOME/artifactory/var/etc/
cd $JFROG_HOME/artifactory/var/etc/
sudo touch ./system.yaml
sudo chown -R 1030:1030 $JFROG_HOME/artifactory/var
docker run --name artifactory -v $JFROG_HOME/artifactory/var/:/var/opt/jfrog/artifactory -d -p 8081:8081 -p 8082:8082 releases-docker.jfrog.io/jfrog/artifactory-oss:7.77.5


################## Create Script for Disk Restore ##################

sudo mkdir -p /scripts

sudo tee /scripts/disk_remount.sh > /dev/null <<-EOF
#!/bin/bash
####################################
# Script for remount jfrog disk

jfrog_config_folder="/opt/jfrog"

# Unmount disk
if mount | grep "on \$jfrog_config_folder " > /dev/null; then
  sudo umount "\$jfrog_config_folder"
fi

# Format the disk with ext4 if it is not ext4
FILESYSTEM_TYPE=\$(sudo blkid -o value -s TYPE /dev/sdb)
if [ "\$FILESYSTEM_TYPE" != "ext4" ]; then
  echo "ERROR!!!! The disk hasn't been formatted to ext4"
  exit 1
fi

# Get the UUID of the disk
UUID=\$(sudo blkid -s UUID -o value /dev/sdb)
# Set other vars

disk_config_fstab="UUID=\$UUID \$jfrog_config_folder ext4 defaults 0 0"
fstab_path="/etc/fstab"

# Change mount entry in /etc/fstab with the attached disk
sudo sed -i "\|\$jfrog_config_folder|c\\\\\$disk_config_fstab" "\$fstab_path"

# Test the /etc/fstab entry without rebooting
sudo mount -a

echo "DONE"
EOF
