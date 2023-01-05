FROM php:7-apache
ARG DEBIAN_FRONTEND=noninteractive
COPY remoteip.conf /etc/apache2/conf-available/remoteip.conf
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y --no-install-recommends libzip-dev \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-enable zip \
    && a2enmod rewrite \
    && a2enmod remoteip \
    && a2enconf remoteip \
    && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
    && rm -r /var/lib/apt/lists/*
