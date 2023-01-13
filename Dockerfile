FROM php:8.2-fpm
RUN groupadd -g 1000 app && \
    useradd -u 1000 -s /bin/bash -g app -G www-data -m app && \
    apt-get update && \
    apt-get install -y \
        unzip \
        git \
        bash-completion
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
USER app