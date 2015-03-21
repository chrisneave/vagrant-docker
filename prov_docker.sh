# Install Docker
sudo apt-get update
sudo apt-get -y install curl
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# Install Docker Compose
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
sudo cp ~/docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
rm ~/docker-compose
