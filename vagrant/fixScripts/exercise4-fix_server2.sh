#!/bin/bash
#add fix to exercise4-server2 here
sudo sed -zi '/192.168.100.10 server1/!s/$/192.168.100.10 server1\n/' /etc/hosts