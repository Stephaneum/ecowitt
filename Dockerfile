# Use the official PHP image with Apache
FROM php:8.0-apache

# Install jq
RUN apt-get update \
    && apt-get install -y jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories and set permissions
RUN mkdir -p /var/www/html/data/report/ \
    && mkdir -p /var/log/ecowitt \
    && chmod 777 /var/log/ecowitt

# Copy the index.php file into the container
COPY index.php /var/www/html/data/report/

# Apache configurations if needed
# For instance, if you need mod_rewrite:
# RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
