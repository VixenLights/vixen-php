FROM php:7-apache
COPY remoteip.conf /etc/apache2/conf-available/remoteip.conf
RUN docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli \
    && a2enmod rewrite \
    && a2enmod remoteip \
    && a2enconf remoteip \
    && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
