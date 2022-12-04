#!/bin/bash
# INSTALA O DOCKER
curl -fsSL https://get.docker.com | sudo bash
sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker vagrant

# CLONA O REPOSITORIO BASE DO LARAVEL
git clone https://github.com/laravel/laravel.git
mv laravel/ projeto-nms/
cd projeto-nms/

vagrant upload SOURCE [DESTINATION] [NAME|ID]

# COPIA O ARQUIVO DE ENVIROMENT DO LARAVEL
vagrant upload ./laravel-env-file.txt .~/projeto-nms/.env nms-app-vm

# COPIA O ARQUIVO DOCKERFILE
vagrant upload ./Dockerfile .~/projeto-nms/Dockerfile nms-app-vm

# COPIA O ARQUIVO DE CONFIGURACAO DO NGINX
mkdir -p docker-compose/nginx
vagrant upload ./dockercompose-nginx.confi .~/projeto-nms/docker-compose/nginx/nms-nginx.conf nms-app-vm

# COPIA O ARQUIVO DE CONFIGURACAO DO MYSQL
mkdir docker-compose/mysql
vagrant upload ./dockercompose-mysql.sql .~/projeto-nms/docker-compose/mysql/init_db.sql nms-app-vm

# COPIA O ARQUIVO DE DOCKER-COMPOSE
vagrant upload ./docker-compose.yml .~/projeto-nms/docker-compose.yml nms-app-vm
