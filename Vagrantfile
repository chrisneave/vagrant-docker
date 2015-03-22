# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "docker"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.11"

  config.vm.provision "shell", keep_color: true, inline: <<-SHELL
    # Install Docker
    sudo apt-get update
    sudo apt-get -y install curl
    curl -sSL https://get.docker.com/ubuntu/ | sudo sh

    # Install Docker Compose
    curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
    sudo cp ~/docker-compose /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    rm ~/docker-compose

    # Add Vagrant user to the Docker group to remove the need to sudo
    sudo gpasswd -a ${USER} docker
    sudo service docker restart
  SHELL

  # Always invoke the docker-up.sh shell script
  config.vm.provision "shell", path: "./docker-up.sh", run: "always", keep_color: true
end
