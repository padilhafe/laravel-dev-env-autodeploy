#!/bin/bash
su vagrant
cd projeto-nms
docker-compose build app
docker-compose up -d
rm -rf vendor/ composer.lock
docker-compose exec -T app composer install
docker-compose exec -T app php artisan key:generate
