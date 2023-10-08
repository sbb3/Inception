#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > seed.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> seed.sql
echo "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';" >> seed.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> seed.sql
echo "FLUSH PRIVILEGES;" >> seed.sql
