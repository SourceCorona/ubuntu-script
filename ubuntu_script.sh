#!/bin/bash
#
echo ""
echo "******************************************"
echo "*   dhurgham UBUNTU 18.10 Script      *"
echo "******************************************"
echo "*       this script well install         *"
echo "*      LAMP server and phpMyAdmin        *"
echo "*     With node js and secure your       *"
echo "*      Domain with Let's Encrypt         *"
echo "******************************************"
echo ""
#
read -p 'Set Web Directory (Example: /var/www/html) ' directory
read -p 'Set Web Domain (Example: 127.0.0.1 [Not trailing slash!]) ' domain
#
sudo apt-get update && sudo apt-get upgrade
sudo apt update && sudo apt dist-upgrade && sudo apt autoremove -y
sudo apt-get install default-jdk -y
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo apt-add-repository ppa:webupd8team/java -y
sudo add-apt-repository ppa:ondrej/php -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo apt-get install -y screen nano curl git zip unzip ufw python-certbot-apache
sudo apt-get install -y libmysqlclient-dev python-dev python-pip
#
sudo apt-get update && sudo apt-get upgrade
#
sudo apt install apache2
#
sudo systemctl stop apache2.service
sudo systemctl start apache2.service
sudo systemctl enable apache2.service
#
sudo ufw app list
sudo ufw app info "Apache Full"
sudo ufw allow in "Apache Full"
#
sudo apt-get install mariadb-server mariadb-client
# for OS 16.04
sudo systemctl stop mysql.service
sudo systemctl start mysql.service
sudo systemctl enable mysql.service
# for OS 18.04 and up
sudo systemctl stop mariadb.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
#
sudo mysql_secure_installation
#
sudo apt update && sudo apt upgrade
sudo apt-get update && sudo apt-get upgrade
#
sudo apt-get install php7.3 libapache2-mod-php7.3 php7.3-common php7.3-mbstring php7.3-xmlrpc php7.3-soap php7.3-gd php7.3-xml php7.3-intl php7.3-mysql php7.3-cli php7.3-zip php7.3-curl php7.3-pdo php7.3-tokenizer php7.3-bcmath php7.3-fpm php7.3-imagick php7.3-recode php7.3-tidy tar redis-server sed composer 
sudo systemctl restart apache2.service
#
echo "Install and Secure phpMyAdmin"
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install phpmyadmin php-gettext
#
sudo a2enmod rewrite
sudo systemctl restart apache2.service
systemctl restart apache2
#
sudo apt-get update && sudo apt-get upgrade
#
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get -y install gcc g++ make
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
#
sudo certbot --apache -d $domain
#
sudo certbot renew --dry-run
#
sudo apt-get update && sudo apt-get upgrade
sudo systemctl restart apache2.service
#
clear
#
echo "your PHP Ver is :"
php -v 
#
echo "your MSQL Ver is :"
mysqladmin -u root -p version 
echo ""
echo "thanks for installing this script !!"
echo "https://t.me/html_iq"
# fix PHPMYADMIN ERR
sudo mysql -u root
#
USE mysql;
UPDATE user SET plugin='mysql_native_password' WHERE User='root';
FLUSH PRIVILEGES;
exit;
#
service mysql restart
#
exit
