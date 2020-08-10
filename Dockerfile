FROM php:7.3-apache

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN apt-get update && \
apt-get install -y apt-utils
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd mysqli ldap mcrypt bcmath pdo_mysql pdo_pgsql pdo_sqlsrv zip xmlrpc
RUN apt-get update && apt-get install -y default-mysql-client
RUN a2enmod rewrite
CMD ["apache2-foreground"]
