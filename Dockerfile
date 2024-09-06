FROM php:7.0-fpm

WORKDIR /var/www/html
COPY ./ ./

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli

