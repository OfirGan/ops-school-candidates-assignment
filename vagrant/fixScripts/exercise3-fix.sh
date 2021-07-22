#!/bin/bash
#add fix to exercise3 here
sudo head -n -3 /etc/apache2/sites-available/000-default.conf > 000-default.temp 
sudo mv 000-default.temp /etc/apache2/sites-available/000-default.conf
rm -f 000-default.temp
sudo systemctl restart apache2