#!/bin/bash
# INSTALA O DOCKER
curl -fsSL https://get.docker.com | sudo bash
sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker vagrant

# CLONA O REPOSITORIO BASE DO LARAVEL
git clone https://github.com/laravel/laravel.git
mv /home/vagrant/laravel/ /home/vagrant/projeto-nms/
cd projeto-nms/
rm composer.json

# CRIA AS PASTAS DE CONFIGURACAO DO CONTAINER
mkdir -p /home/vagrant/projeto-nms/docker-compose/nginx/
mkdir -p /home/vagrant/projeto-nms/docker-compose/mysql/
chown -R vagrant:vagrant /home/vagrant/projeto-nms/