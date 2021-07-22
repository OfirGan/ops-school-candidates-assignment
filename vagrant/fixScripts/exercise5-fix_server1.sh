#!/bin/bash
#add fix to exercise5-server1 here

# Enable PasswordAuthentication & Disable StrictHostKeyChecking
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#   PasswordAuthentication yes/    PasswordAuthentication yes/g' /etc/ssh/ssh_config
sudo sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo systemctl restart sshd
sudo systemctl restart ssh

# create vagrant ssh key pair
su - vagrant -c "ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ''"

# Install sshpass for auto ssh connection
sudo apt-get update -y
sudo apt-get install -y sshpass
