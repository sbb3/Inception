FROM alpine:3.16

RUN apk update && apk add --no-cache php8 php8-fpm php8-mysqli php8-pecl-redis php8-opcache php8-phar mysql-client php8-iconv php8-mbstring php8-session php8-tokenizer php8-common php8-ctype curl tar nano

#/run/php directory to allow PHP-FPM to create its socket file

RUN sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#' /etc/php8/php-fpm.d/www.conf \
	&& sed -i 's/^listen.allowed_clients = 127.0.0.1$/listen.allowed_clients = any/' /etc/php8/php-fpm.d/www.conf
	# && sed -i 's#listen = 127.0.0.1:9000#listen = /var/run/php-fpm.sock#' /etc/php8/php-fpm.d/www.conf \
	# && sed -i 's#;listen.owner = nobody#listen.owner = nobody#' /etc/php8/php-fpm.d/www.conf \
	# && sed -i 's#;listen.group = nobody#listen.group = nobody#' /etc/php8/php-fpm.d/www.conf \
	# && sed -i 's#;listen.mode = 0660#listen.mode = 0660#' /etc/php8/php-fpm.d/www.conf \

COPY ./tools/wordpress_install.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wordpress_install.sh

WORKDIR /var/www/html/

CMD sh -c 'wordpress_install.sh'
