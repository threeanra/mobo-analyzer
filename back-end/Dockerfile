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
        sed -i 's/DB_HOST=.*/DB_HOST=db_ta/' .env && \
        sed -i 's/DB_DATABASE=.*/DB_DATABASE=db_ta/' .env && \
        sed -i 's/DB_USERNAME=.*/DB_USERNAME=db_ta_user/' .env && \
        sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=db_ta_044\$/' .env && \
        php artisan key:generate && \
        php artisan config:clear; \
    fi && \
    php artisan serve --host=0.0.0.0 --port=8000"
