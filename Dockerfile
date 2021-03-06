FROM wordpress:php8.1-apache
WORKDIR /var/www/html/

RUN apt-get clean
RUN apt-get update

#install some basic tools
RUN apt-get install -y \
        git \
        curl \
        wget \
        libzip-dev \
        zip \
        unzip \
        && docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY app/ ./

RUN ls -lah

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]