#!/bin/sh

set -e

if ! [[ -f index.php ]]; then

# Download adminer
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O index.php

fi

#run in foreground, -F, to run in background php-fpm8
php-fpm8 --nodaemonize
