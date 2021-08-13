FROM php:7.4.22-apache


RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

RUN apt-get update && apt-get install -y  libxrender1  libfontconfig   libxtst6  xz-utils   libfreetype6-dev   libjpeg62-turbo-dev   libmcrypt-dev libpng-dev libjpeg-dev libfreetype6-dev
RUN docker-php-ext-configure gd --with-jpeg && docker-php-ext-install calendar pdo_mysql gd
RUN pecl install xdebug && docker-php-ext-enable xdebug
ADD docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

ENV APACHE_RUN_USER apache
RUN useradd -d /var/www --uid=1000 --group=www-data -s /sbin/nologin  apache
