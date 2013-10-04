$script = <<SCRIPT

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

# Commands specific to Vagrant (development)
apt-get install -y php5-xdebug phpunit

service php5-fpm start && nginx

SCRIPT

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/165709740/boxes/precise64-vanilla.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "./", "/app"

  config.vm.provision "shell", inline: $script

end
