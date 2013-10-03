#!/bin/bash

# Common commands on Vagrant & Docker

echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
apt-get update
apt-get -y install curl dialog net-tools lynx nano wget
apt-get -y install python-software-properties
add-apt-repository -y ppa:nginx/stable
add-apt-repository -y ppa:ondrej/php5-oldstable
apt-get update

apt-get -y install nginx php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt php5-cli

cat /app/nginx.conf > /etc/nginx/sites-available/default

echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini

mkdir -p /var/www/public

echo "<?php phpinfo(); ?>" > /var/www/public/index.php

# Commands specific to installing on Docker (production)

echo "daemon off;" >> /etc/nginx/nginx.conf

# Startup

service php5-fpm start && nginx
