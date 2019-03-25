# Comment Out Default Setting
sudo sed -i -e "s/PubkeyAuthentication/#ByRaspbianFile# PubkeyAuthentication/g" /etc/ssh/sshd_config
sudo sed -i -e "s/PasswordAuthentication/#ByRaspbianFile# PasswordAuthentication/g" /etc/ssh/sshd_config
# Set The New Setting
sudo sed -i -e "/^#*ByRaspbianFile# PubkeyAuthentication .*$/a PubkeyAuthentication yes" /etc/ssh/sshd_config
sudo sed -i -e "/^#*ByRaspbianFile# PasswordAuthentication .*$/a PasswordAuthentication no" /etc/ssh/sshd_config
