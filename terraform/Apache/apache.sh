#!/bin/bash

sudo apt update
sudo apt install apache2 -y 
sudo echo  " Sagar Soin " > /var/www/html/index.html
sudo systemctl restart apache2