FROM voduytuan/docker-nginx-php

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/ && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install PHP libs
RUN composer -n require phploc/phploc:* phpunit/phpunit:~4.0 pdepend/pdepend:~2.0 phpmd/phpmd:~2.2 sebastian/phpcpd:* sebastian/phpdcd:* \
    squizlabs/php_codesniffer:* codeception/codeception:*

# make path to phplibs (phpcs..)
RUN echo "export PATH=$PATH:/vendor/bin" >> /root/.bashrc

# Upload source
RUN source /root/.bashrc
