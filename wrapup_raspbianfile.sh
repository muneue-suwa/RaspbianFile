# Comment Out Default Setting
sudo sed -i -e "s/PubkeyAuthentication/#Rfile# PubkeyAuthentication/g" /etc/ssh/sshd_config
sudo sed -i -e "s/PasswordAuthentication/#Rfile# PasswordAuthentication/g" /etc/ssh/sshd_config
# Set The New Setting
sudo sed -i -e "/^#Rfile# PubkeyAuthentication$/a PubkeyAuthentication yes" /etc/ssh/sshd_config
sudo sed -i -e "/^#Rfile# PasswordAuthentication$/a PasswordAuthentication no" /etc/ssh/sshd_config
