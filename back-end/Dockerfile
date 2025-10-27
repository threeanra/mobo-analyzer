FROM php:8.3-cli

RUN apt-get update && apt-get install -y \
    git unzip libpng-dev libonig-dev libxml2-dev libzip-dev zip curl && \
    docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

WORKDIR /var/www/html

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY composer.json composer.lock ./

RUN composer install --no-interaction --prefer-dist --no-scripts

COPY . .

EXPOSE 8000

# Development mode
CMD bash -c "composer install --no-interaction --prefer-dist && \
    if [ ! -f .env ]; then \
        cp .env.example .env && \
        php artisan key:generate && \
        php artisan migrate --force || true; \
    fi && \
    php artisan serve --host=0.0.0.0 --port=8000"
