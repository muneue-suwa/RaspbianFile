# Comment Out Default Setting
sudo sed -e "s/PubkeyAuthentication/#Rfile# PubkeyAuthentication/g" /etc/ssh/sshd_config
sudo sed -e "s/PasswordAuthentication/#Rfile# PasswordAuthentication/g" /etc/ssh/sshd_config
# Set The New Setting
sudo sed -e "/#Rfile# PubkeyAuthentication/\i PubkeyAuthentication yes" /etc/ssh/sshd_config
sudo sed -e "/#Rfile# PasswordAuthentication/\i PasswordAuthentication no" /etc/ssh/sshd_config
