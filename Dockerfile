FROM voduytuan/docker-nginx-php

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/ && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install PHP libs
RUN composer -n require phploc/phploc:* phpunit/phpunit:~4.0 pdepend/pdepend:~2.0 phpmd/phpmd:~2.2 sebastian/phpcpd:* sebastian/phpdcd:* \
    squizlabs/php_codesniffer:* codeception/codeception:*

RUN rm /etc/apt/sources.list.d/ondrej-php5-trusty.list
RUN apt-get update
RUN apt-get -y -f install php5-dev php-pear rsync git-core




