# Use official PHP image with FPM
FROM php:8.1-fpm

# Install dependencies for Laravel
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libzip-dev unzip curl git \
    && docker-php-ext-configure gd \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl gd

# Install Composer (a tool for PHP dependency management)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory inside the container
WORKDIR /var/www

# Copy the project files into the container's working directory
COPY . .

# Set appropriate permissions for Laravel directories
RUN chown -R www-data:www-data /var/www && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Expose port 8000 for the Laravel application
EXPOSE 8000

# Install dependencies using Composer
RUN composer install --no-interaction

# Generate Laravel Activation Key
RUN php artisan key:generate

# Run the Laravel server using php artisan serve
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
