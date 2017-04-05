FROM php:5.6

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Install VIM, CURL, WGET, GIT, PYTHON
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim curl wget build-essential python-software-properties

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/ && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install PHP Code Sniffer
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && chmod 755 phpcs.phar && mv phpcs.phar /usr/local/bin/ && ln -s /usr/local/bin/phpcs.phar /usr/local/bin/phpcs


# CLEAN
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
