ARG VERSION=""
FROM php:$VERSION-alpine

RUN set -eux; \
  apk add --no-cache \
    bash \
    tini \
    openssh-client

RUN printf "# composer php cli ini settings\n\
date.timezone=UTC\n\
memory_limit=-1\n\
" > $PHP_INI_DIR/php-cli.ini

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH /composer/vendor/bin:$PATH

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer global -q require hirak/prestissimo
RUN composer global -q require deployer/deployer friendsofphp/php-cs-fixer phpstan/phpstan

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]

CMD ["composer"]