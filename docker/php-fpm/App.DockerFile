FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    locales \
    libzip-dev unzip \
    curl

# Install XDebug
RUN pecl install xdebug-2.9.6

RUN docker-php-ext-install pdo_mysql zip
RUN docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash

WORKDIR /var/www/library_api
