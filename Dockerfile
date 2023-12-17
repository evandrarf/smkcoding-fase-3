FROM php:8.2-apache

WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        zip \
        unzip \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        nano \
        && docker-php-ext-install pdo_mysql mysqli mbstring zip exif pcntl bcmath gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_21.x | bash - && \
    apt-get install -y nodejs

RUN composer global require laravel/installer

ENV PATH="/root/.composer/vendor/bin:${PATH}"

COPY . .

RUN composer install

RUN npm install

RUN npm run build

EXPOSE 80

CMD ["apache2-foreground"]
