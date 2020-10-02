ARG PHP_VERSION
FROM php:$PHP_VERSION-fpm

RUN apt-get update -y && apt-get install -y \
    libldap2-dev \
    libpng-dev \
    libonig-dev \
    libpq-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    libzip-dev \
    zip \
    git \
    jpegoptim \
    optipng \
    pngquant \
    gifsicle \
    vim \
    unzip \
    curl \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& docker-php-ext-install sockets pdo pdo_pgsql pgsql mbstring zip exif pcntl \
&& docker-php-ext-configure gd --with-freetype --with-jpeg \
&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
&& docker-php-ext-install gd ldap \
&& pecl install xdebug \
&& docker-php-ext-enable xdebug \
&& echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer