#!/bin/bash

# Common commands on Vagrant & Docker

echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
apt-get update
apt-get -y install dialog net-tools lynx nano wget
apt-get -y install python-software-properties
add-apt-repository -y ppa:nginx/stable
add-apt-repository -y ppa:ondrej/php5-oldstable
apt-get update

apt-get -y install nginx php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt

wget -O /etc/nginx/sites-available/default https://gist.github.com/darron/6159214/raw/30a60885df6f677bfe6f2ff46078629a8913d0bc/gistfile1.txt
echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini

mkdir /var/www
echo "<?php phpinfo(); ?>" > /var/www/index.php

# Commands specific to installing on Vagrant (development)

# ...?

# Startup

service php5-fpm start && nginx
