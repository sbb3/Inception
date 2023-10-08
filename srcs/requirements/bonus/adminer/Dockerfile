FROM alpine:3.16

RUN apk update && apk add --no-cache php8 php8-fpm php8-mysqli php8-opcache php8-phar mysql-client php8-iconv php8-mbstring php8-session

# listen on any network interfaces, accept connections from any ip address
RUN sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#' /etc/php8/php-fpm.d/www.conf \
	&& sed -i 's/^listen.allowed_clients = 127.0.0.1$/listen.allowed_clients = /' /etc/php8/php-fpm.d/www.conf

COPY ./tools/adminer_install.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/adminer_install.sh

WORKDIR /var/www/html/

CMD sh -c "/usr/local/bin/adminer_install.sh && php-fpm8 --nodaemonize"

# flush the cache after any edit
# wp cli: wp cache flush
# redis cli: redis-cli flushall

