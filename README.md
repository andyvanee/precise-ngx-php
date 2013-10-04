precise-ngx-php
===============

Vagrant / Docker boxes - PHP app server

A Vagrant box (for development) and Docker container (for production) built
the same way.

- Ubuntu 12.04 Precise 64
- Nginx
- PHP-FPM

## To build a new Vagrant box:

    # Build & run the box
    vagrant up
    VBoxManage list runningvms
        ---> copy the name of the vm, eg "precise-ngx-php_1380859657"
    vagrant ssh   # Check that everything looks ok
    vagrant halt
    vagrant package --output build/precise-ngx-php.box --base {name of vm here}

Now you can upload the file somewhere ( build/precise-ngx-php.box ), or just
use it by name after running:

    vagrant box add precise-php build/precise-ngx-php.box`

    # then in any other Vagrantfile
    config.vm.box = "precise-php"

## To build a new Docker container

    # clone this repo inside the docker repo (just easier)
    cd docker
    export FORWARD_DOCKER_PORTS=true  # so we can view things in our browser
    vagrant up
    vagrant ssh
    $ sudo bash   # all docker commands now require root
    $ cd /vagrant/precise-nginx-php
    $ docker build -t yourname/nginx-php .
    $ docker run -d yourname/nginx-php
    $ docker ps

The last line will show you the port that it's running on
( eg: http://127.0.0.1:49155 )
