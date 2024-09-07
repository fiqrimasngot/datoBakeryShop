
# Use the official PHP image with Apache
FROM php:8.2-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the current directory contents into the container
COPY . /var/www/html
RUN chown -R www-data:www-data /var/www/html


# Install necessary PHP extensions (if needed)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set the default page to home.php using Apache configuration
RUN echo "DirectoryIndex home.php" > /etc/apache2/mods-enabled/dir.conf

# Expose port 80
EXPOSE 80

# Start Apache server in the foreground
CMD ["apache2-foreground"]
