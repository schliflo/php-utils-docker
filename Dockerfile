FROM webdevops/php:7.0

RUN set -x \
    # Install php environment
    && apt-install \
        # Install tools
	libmagickwand-dev \
    # Install extensions for PHP 7.x
    && pecl install imagick \
    && echo extension=imagick.so > /usr/local/etc/php/conf.d/imagick.ini \
    # Enable php services
    && docker-service enable syslog \
    && docker-service enable cron \
    && docker-run-bootstrap \
    && docker-image-cleanup

