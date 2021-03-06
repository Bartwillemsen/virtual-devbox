#!/usr/bin/env bash

# Upgrade Base System.
sudo apt-get update
sudo apt-get upgrade -y

# Install web packages.
sudo apt-get install -y build-essential dkms apache2 php7.0 php-pear php7.0-sqlite3 php7.0-mysql \
curl php7.0-curl memcached openssh-server git vim subversion

# Download Bash Aliases
wget -O ~/.bash_aliases https://raw.githubusercontent.com/Bartwillemsen/virtual-devbox/master/aliases

# Set Apache ServerName
sudo sed -i "s/#ServerRoot.*/ServerName ubuntu/" /etc/apache2/apache2.conf
sudo service apache2 restart

# Install MySQL
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password secret'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password secret'
sudo apt-get -y install mysql-server

# Configure MySQL.
sudo sed -i '/^bind-address/s/bind-address.*=.*/bind-address = 10.0.2.15/' /etc/mysql/my.cnf
mysql -u root -p mysql -e "GRANT ALL ON *.* TO root@'10.0.2.2' IDENTIFIED BY 'secret';"
sudo service mysql restart

# Enable PHP Error reporting.
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/cli/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/cli/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php5/cli/php.ini

# Generate SSH Key
cd ~
mkdir .ssh
cd ~/.ssh
ssh-keygen -f id_rsa -t rsa -N ''

# Create Scripts directory.
mkdir ~/Scripts
mkdir ~/Scripts/PhpInfo

# Download Serve script.
wget -O ~/Scripts/serve.sh https://raw.githubusercontent.com/Bartwillemsen/virtual-devbox/master/serve.sh

# Create PHP Info site.
echo "<?php echo phpinfo();" > ~/Scripts/PhpInfo/index.php

#Configure VirtualHosts
sudo a2enmod rewrite
vhost="<VirtualHost *:80>
    ServerName info.app
	DocumentRoot /home/bart/Scripts/PhpInfo
	<Directory \"/home/bart/Scripts/PhpInfo\">
		Order allow,deny
		Allow from all
		Require all granted
		AllowOverride all
	</Directory>
</VirtualHost>"
echo "$vhost" | sudo tee /etc/apache2/sites-available/info.app.conf
sudo a2ensite info.app
sudo service apache2 restart

#VirtualBox Guest Additions.
sudo mount /dev/cdrom /media/cdrom
sudo bash /media/cdrom/VBoxLinuxAdditions.run
sudo usermod -aG vboxsf www-data
sudo usermod -aG vboxsf bart

# Finally, reboot to apply all changes.
sudo reboot
