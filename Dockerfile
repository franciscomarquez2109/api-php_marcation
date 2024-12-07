# Usar la imagen oficial de PHP con Apache
FROM php:8.1-apache

# Instalar extensiones necesarias para PostgreSQL y otras dependencias
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Copiar los archivos de la aplicación al directorio web de Apache
COPY . /var/www/html/

# Establecer permisos adecuados para los archivos y directorios
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Habilitar módulos de Apache si es necesario (mod_rewrite, etc.)
RUN a2enmod rewrite

# Exponer el puerto 80
EXPOSE 80
