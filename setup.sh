#!/usr/bin/env bash

# Upgrade Base System.
sudo apt-get update
sudo apt-get upgrade -y

# Install web packages.
sudo apt-get install -y build-essential dkms apache2 php5 php5-xdebug php5-sqlite php5-mysql openssh-server \
git vim subversion mysql-server

# Configure MySQL.
sudo sed  -i '/^bind-address/s/bind-address.*=.*/bind-address = 0.0.0.0' /etc/mysql/my.cnf
mysql -u root -e "GRANT ALL ON *.* TO 'root'@'%'"
sudo service mysql restart

# Create Scripts directory.
mkdir ~/Scripts
mkdir ~/Scripts/PhpInfo

# Create PHP Info site.
echo "<?php echo phpinfo();" > ~/Scripts/PhpInfo/index.php

#Configure VirtualHosts
sudo a2enmod rewrite
echo "127.0.0.1  info.app" | sudo tee -a /etc/hosts

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

# Add www-data and own useraccount to vboxsf group to get access to
# shared folder.
sudo usermod -a -G vboxsf www-data
sudo usermod -a -G vboxsf bart

# Finally, reboot to apply all changes.
sudo reboot