echo "127.0.0.1 $1" >> "/etc/hosts"

vhost="<VirtualHost *:80>
    ServerName $1
    DocumentRoot /media/sf_php/$2
    <Directory \"/media/sf_php/$2\">
        Order allow,deny
        Allow from all
        Require all granted
        AllowOverride All
    </Directory>
</VirtualHost>"

echo "$vhost" >> "/etc/apache2/sites-available/$1.conf"

ln -s "/etc/apache2/sites-available/$1.conf" "/etc/apache2/sites-enabled/$1.conf"

service apache2 reload