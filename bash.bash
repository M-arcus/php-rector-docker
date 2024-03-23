#!/bin/bash
curl -sS https://getcomposer.org/installer | php -- --filename=composer.php && \
    chmod +x composer.php && \
    php composer.php req -n -o frosh/shopware-rector:0.3.0 rector/rector:1.0.3 && \
    rm -f composer.php composer.json composer.lock
