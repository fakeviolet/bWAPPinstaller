#!/bin/bash
#bWAPP installer
wget https://altushost-swe.dl.sourceforge.net/project/bwapp/bWAPP/bWAPP_latest.zip -P Downloads
cd Downloads
sudo unzip -d /var/www/html bWAPP_latest.zip
cd /var/www/html
sudo chmod -R 777 bWAPP
sudo service apache2 start
sudo service apache2 status
sudo service mysql start
sudo service mysql status
cd bWAPP/admin
sudo sed -i 's/"root"/"user"/g' /var/www/html/bWAPP/admin/settings.php
sudo sed -i 's/"bug"/"pass"/g' /var/www/html/bWAPP/admin/settings.php
sudo systemctl start mysql
sudo systemctl status mysql
sudo mysql --execute=create user 'user'@'localhost' identified by 'pass';
sudo mysql --execute=grant all privileges on bWAPP.* to 'user'@'localhost' identified by 'pass';
#open localhost/bWAPP/install.php
#click install
