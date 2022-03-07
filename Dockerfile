FROM composer:2.2.7 as composer_image
RUN rm -rf /var/www && mkdir -p /var/www/html
WORKDIR /var/www/html
COPY app/composer.json ./
RUN composer install --ignore-platform-reqs --prefer-dist --no-scripts --no-progress --no-suggest --no-interaction --no-dev --no-autoloader
RUN composer dump-autoload --optimize --apcu --no-dev

FROM php:8.0-apache
COPY --from=composer_image /var/www/html /var/www/html
WORKDIR /var/www/html/
COPY app/ ./
RUN a2enmod rewrite headers
RUN ls -lah
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]