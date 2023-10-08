FROM alpine:3.16

# script that is used to create the system tables in the MySQL database. It initializes the MySQL data directory and creates the necessary system tables in the MySQL database, including the mysql database, which stores user account and privilege information.
RUN apk update  && apk upgrade && apk add --no-cache mariadb mariadb-client \
&& mkdir -p /run/mysqld \
&& chown -R mysql:mysql /run/mysqld \
&& mysql_install_db --user=mysql --datadir=/var/lib/mysql \
&& chown -R mysql:mysql /var/lib/mysql \
&& sed -i 's/^skip-networking/#&/' /etc/my.cnf.d/mariadb-server.cnf \
&& sed -i 's/^#bind-address/bind-address/' /etc/my.cnf.d/mariadb-server.cnf

# ARG instruction is a build time cmd, init these variable from docker compose using args directive
# declaring the variables
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

COPY ./tools/init.sh .

RUN chmod +x init.sh && ./init.sh && rm -rf init.sh

CMD sh -c 'mysqld --user=mysql --init-file=/seed.sql'
#By default, running mysqld as root is not recommended for security reasons. Instead, it is recommended to run mysqld as a non-root user, mysql user is created on mysql installation
