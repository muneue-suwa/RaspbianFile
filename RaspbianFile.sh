#!/usr/bin/env bash

# Get INSTALL_SH_DIRNAME
RASPBIANFILE_SH_FILENAME=`readlink -f $0`
RASPBIANFILE_SH_DIRNAME=`dirname $RASPBIANFILE_SH_FILENAME`

# Read setting setting file
if [ -f $RASPBIANFILE_SH_DIRNAME/setting/RaspbinaFile.cfg ]; then
    . $RASPBIANFILE_SH_DIRNAME/setting/RaspbinaFile.cfg
else
    echo "Make the RaspbinaFile.cfg"
    exit 1
fi

# Check The Public Key
if [ -f $RASPBIANFILE_SH_DIRNAME/$PUBLICKEY_FILENAME ]; then
    echo "Public Key was checked"
else
    echo "Please check $PUBLICKEY_FILENAME"
    exit 1
fi

# Update Raspbian
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

# Install Applications
sudo apt install ufw
sudo apt install $ADDITIONAL_APPLICATIONS

# Create NewUser
sudo adduser $NEW_USER

# Add Groups to NewUser
PI_GROUPS=$(groups)
NEW_USER_GROUP=$(echo $PI_GROUPS | tr " " ",")
sudo usermod -G $NEW_USER_GROUP $NEW_USER

# Copy The Public Key
sudo mkdir -p /home/$NEW_USER/.ssh
sudo cp $RASPBIANFILE_SH_DIRNAME/$PUBLICKEY_FILENAME /home/$NEW_USER/.ssh/authorized_keys

# Change owner, group, and permisson of Public Key
sudo chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh
sudo chmod 700 /home/$NEW_USER/.ssh
sudo chmod 600 /home/$NEW_USER/.ssh/authorized_keys

# Set SSH Server
## Make a Backup
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.org
## Comment Out Default Setting
sudo sed -e "s/PermitRootLogin/#Rfile# PermitRootLogin/g" /etc/ssh/sshd_config
sudo sed -e "s/PermitEmptyPasswords/#Rfile# PermitEmptyPasswords/g" /etc/ssh/sshd_config
## Set The New Setting
sudo sed -e "/#Rfile# PermitRootLogin/\i PermitRootLogin no" /etc/ssh/sshd_config
sudo sed -e "/#Rfile# PermitEmptyPasswords/\i PermitEmptyPasswords no" /etc/ssh/sshd_config
## Copy wrapup_raspbianfile.sh to the home directory
sudo cp $RASPBIANFILE_SH_DIRNAME/wrapup_raspbianfile.sh /home/$NEW_USER/
sudo chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/wrapup_raspbianfile.sh

# Set crontab for finishing
sudo crontab $RASPBIANFILE_SH_DIRNAME/crontab/finishing.crontab

# Remove RaspbianFile from /home/pi/
rm -rf $RASPBIANFILE_SH_DIRNAME

# Reboot
sudo reboot
