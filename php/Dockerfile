FROM php:8.3-apache-bookworm
 
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install libsqlite3-dev libsqlite3-0 -y

RUN docker-php-ext-install mysqli

RUN apt-get update -y && apt-get install libldap2-dev -y

RUN docker-php-ext-install ldap

RUN a2enmod rewrite headers
