precise-ngx-php
===============

Vagrant / Docker boxes - PHP app server

Trying to build Vagrant boxes and Docker containers the same way.

- Precise64
- Nginx
- PHP-FPM

## To build a new vagrant box:

    # Build the machine ( uses ./build_vagrant.sh )
    vagrant up

    # Take not of the name that virtual box gave it
    VBoxManage list runningvms

    # SSH in if you'd like to confirm everything is in place
    vagrant ssh
    # ...

    # If it's all good
    vagrant halt

    # Substitute your own virtualbox name for the --base option
    vagrant package --output precise-ngx-php.box --base precise-ngx-php_1380768459

    # Upload the file at build/precise-ngx-php.box somewhere, or add it to
    # vagrant like so.
    vagrant box add precise-php build/precise-ngx-php.box

    # Now you can use it for any project, just add this to your Vagrantfile
    config.vm.box = "precise-php"

