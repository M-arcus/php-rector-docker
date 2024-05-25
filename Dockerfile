FROM ghcr.io/m-arcus/php-rector:base

ARG PHP_RECTOR_VERSION=1.0.3

LABEL org.opencontainers.image.authors="M-arcus" \
      org.opencontainers.image.url="https://github.com/rectorphp/rector" \
      org.opencontainers.image.documentation="https://github.com/rectorphp/rector/blob/main/README.md" \
      org.opencontainers.image.source="https://github.com/M-arcus/php-rector-docker" \
      org.opencontainers.image.vendor="M-arcus" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="Rector"

COPY composer.json composer.lock ./

RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer.php && \
    chmod +x composer.php && \
    php composer.php req -n -o -W rector/rector:${PHP_RECTOR_VERSION} && \
    rm -f composer.php composer.json composer.lock

ENTRYPOINT ["/usr/bin/php", "/vendor/bin/rector"]
