#!/bin/bash
#add fix to exercise5-server2 here

# Install sshpass for auto ssh connection 
sudo apt-get update -y
sudo apt-get install -y sshpass

# Enable PasswordAuthentication & Disable StrictHostKeyChecking
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#   PasswordAuthentication yes/    PasswordAuthentication yes/g' /etc/ssh/ssh_config
sudo sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo systemctl restart sshd
sudo systemctl restart ssh

#Vagrant ssh-copy-id server1 to server2
sshpass -p vagrant ssh vagrant@192.168.100.10 "sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -f server2"

#Vagrant ssh-copy-id server2 to server1
#su - vagrant -c "ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ''"
#su - vagrant -c "sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub -f 192.168.100.10"

