FROM voduytuan/docker-nginx-php

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/ && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install PHP libs
RUN composer -n require phploc/phploc:* phpunit/phpunit:~4.0 pdepend/pdepend:~2.0 phpmd/phpmd:~2.2 sebastian/phpcpd:* sebastian/phpdcd:* \
    squizlabs/php_codesniffer:* codeception/codeception:*

# RUN rm /etc/apt/sources.list.d/ondrej-php5-trusty.list
RUN apt-get update
RUN apt-get -y -f install php5-dev php-pear rsync

# Install php xdebug extension for code coverage
# Setup the Xdebug version to install
ENV XDEBUG_VERSION 2.3.3
ENV XDEBUG_MD5 60e6fdf41840104a23debe16db15a2af

# Install Xdebug
RUN set -x \
     && curl -SL "http://www.xdebug.org/files/xdebug-$XDEBUG_VERSION.tgz" -o xdebug.tgz \
     && echo $XDEBUG_MD5 xdebug.tgz | md5sum -c - \
     && mkdir -p /usr/src/xdebug \
     && tar -xf xdebug.tgz -C /usr/src/xdebug --strip-components=1 \
     && rm xdebug.* \
     && cd /usr/src/xdebug \
     && phpize \
     && ./configure \
     && make -j"$(nproc)" \
     && make install \
     && make clean

COPY ext-xdebug.ini /etc/php5/mods-available/
COPY ext-xdebug.ini /etc/php5/cli/conf.d/




