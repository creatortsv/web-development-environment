#!/bin/bash
set -e

apt-get update -y
apt-get install -y libpng-dev libonig-dev libpq-dev libjpeg62-turbo-dev libfreetype6-dev locales libzip-dev zip git jpegoptim optipng pngquant gifsicle vim unzip curl
apt-get clean
rm -rf /var/lib/apt/lists/*
docker-php-ext-install pdo pdo_pgsql pgsql mbstring zip exif pcntl
docker-php-ext-configure gd --with-freetype --with-jpeg
docker-php-ext-install gd
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer install