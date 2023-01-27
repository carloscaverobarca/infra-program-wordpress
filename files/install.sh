#!/bin/bash

# install wordpress files
curl -LO https://wordpress.org/wordpress-5.6.tar.gz
tar xzvf wordpress-5.6.tar.gz
rm -rf /var/www/html
mv ./wordpress /var/www/html

# Change www properties
chmod -R 0755 /var/www/html
chown -R www-data:www-data /var/www/html

# setup MySQL database user
sudo mysql -uroot -proot -hlocalhost -e "DROP DATABASE IF EXISTS wordpress; CREATE DATABASE wordpress; CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'wordpress123'; GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'localhost'; FLUSH PRIVILEGES;"

# restart services to take new configurations
service php7.4-fpm restart
service mysql restart
service nginx restart
