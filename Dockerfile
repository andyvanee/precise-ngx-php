FROM ubuntu

MAINTAINER Andy Vanee "1andyvanee@gmail.com"

ADD . /app

EXPOSE 80

RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install curl dialog net-tools lynx nano wget
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN add-apt-repository -y ppa:ondrej/php5-oldstable
RUN apt-get update
RUN apt-get -y install nginx php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt php5-cli
RUN cat /app/nginx.conf > /etc/nginx/sites-available/default
RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
RUN mkdir -p /var/www/public
RUN echo "<?php phpinfo(); ?>" > /var/www/public/index.php

# Commands specific to Docker (production)
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD service php5-fpm start && nginx
