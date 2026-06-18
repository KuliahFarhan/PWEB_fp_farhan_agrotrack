FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql opcache
RUN a2enmod rewrite headers

COPY docker/opcache.ini /usr/local/etc/php/conf.d/opcache.ini
COPY . /var/www/html/
COPY docker/apache-security.conf /etc/apache2/conf-available/agrotrack-security.conf
RUN a2enconf agrotrack-security

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
