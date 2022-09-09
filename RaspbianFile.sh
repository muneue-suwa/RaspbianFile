#!/usr/bin/env bash

# Get CREATE_NEW_USER_SH_DIRNAME
CREATE_NEW_USER_SH_FILENAME=`readlink -f $0`
CREATE_NEW_USER_SH_DIRNAME=`dirname $CREATE_NEW_USER_SH_FILENAME`

NEW_USER=$1
PUBLICKEY_FILENAME=$2

# Check the number of arguments
if [ $# -ne 2 ]; then
    echo "Usage: bash create_new_user.sh USERNAME PUBLIC_KEY_FILENAME" 1>&2
    exit 1
fi

# Check the public key
if [ -f $PUBLICKEY_FILENAME ]; then
    echo "Public Key DOES exist!"
else
    echo "Create public key: $PUBLICKEY_FILENAME" 1>&2
    exit 1
fi

# Create NewUser
sudo adduser $NEW_USER

# Get the current user's groups
CURRENT_USERS_GROUPS=$(groups)

# Add the new user to the current user's groups
NEW_USER_GROUP=$(echo ${CURRENT_USERS_GROUPS//$USER/} | sed s/sudo\ // | tr " " ",")
echo "$NEW_USER's secondary groups: $NEW_USER_GROUP"
sudo usermod -aG $NEW_USER_GROUP $NEW_USER

# Copy the public key
sudo mkdir -p /home/$NEW_USER/.ssh
sudo cp $CREATE_NEW_USER_SH_DIRNAME/$PUBLICKEY_FILENAME /home/$NEW_USER/.ssh/authorized_keys

# Change owner, group, and permisson of Public Key
sudo chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh
sudo chmod 700 /home/$NEW_USER/.ssh
sudo chmod 600 /home/$NEW_USER/.ssh/authorized_keys

# Completion message
echo "Complited!"
