#!/usr/bin/env bash
set -o errexit

# Install PHP & dependencies
apt-get update
apt-get install -y php-cli php-mbstring php-xml unzip curl

# Install Composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel dependencies
composer install --no-dev --optimize-autoloader

# Set permissions
chmod -R 777 storage bootstrap/cache

# Run database migrations
php artisan migrate --force
