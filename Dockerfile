FROM php:5.6-apache

RUN apt-get update
RUN apt-get install -y libpq-dev \
libjpeg-dev \
libpng-dev \
libicu-dev \
vim \
&& docker-php-ext-configure gd --with-jpeg-dir=/usr/include --with-png-dir=/usr/include \
&& docker-php-ext-install gd opcache pgsql pdo_pgsql mysql pdo_mysql intl

RUN a2enmod rewrite
EXPOSE 80




WORKDIR /var/www/html

#CMD ["apache2ctl", "-DFOREGROUND"]だと動かない
CMD ["apache2ctl", "-D", "FOREGROUND"]