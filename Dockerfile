FROM php:5.6-apache

MAINTAINER original.image

RUN apt-get update
RUN apt-get install -y libpq-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y vim
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include --with-png-dir=/usr/include
RUN docker-php-ext-install gd
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install mysql
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install intl

RUN a2enmod rewrite
EXPOSE 80




WORKDIR /var/www/html

CMD ["apache2ctl", "start"]

#ENTRYPOINT ["/usr/local/bin/docker-php-entrypoint", "-DFOREGROUND"]
#WORKDIR /var/www/html
#CMD ["/usr/local/bin/docker-php-entrypoint", "-DFOREGROUND"]