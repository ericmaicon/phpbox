#!/bin/sh

#MySQL
if [ -f /etc/my.cnf ]; then
    echo "MySQL already configured"
else
    echo "Installing MySQL"

    cp /var/www/recipes/templates/my.cnf /etc/my.cnf
    /usr/local/mysql/bin/mysqld_safe --user=mysql &
    /usr/local/mysql/bin/mysqladmin -u root password "test"
    /usr/local/mysql/bin/mysql --user=root --pasword=test -e "grant all on *.* to root@'%' identified by 'test'; flush privileges;"
    cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql
    chmod +x /etc/init.d/mysql
    update-rc.d mysql defaults
    /etc/init.d/mysql stop
    /etc/init.d/mysql start
fi

#PostgreSQL
if id -u "pgsql" >/dev/null 2>&1; then
    echo "PostgreSQL already configured"
else
    echo "Configuring PostgreSQL"

    useradd pgsql
    mkdir /usr/local/postgres/data
    chown -R pgsql:pgsql /usr/local/postgres

    sudo -u pgsql initdb -U pgsql -D /usr/local/postgres/data --locale=en_US.UTF-8

    mv /usr/local/postgres/data/postgresql.conf /usr/local/postgres/data/postgresql.conf.default
    cp /var/www/recipes/templates/postgresql.conf /usr/local/postgres/data/postgresql.conf
    cp /var/www/recipes/templates/postgresql.sh /etc/init.d/postgresql
    chmod +x /etc/init.d/postgresql
    sysctl -w kernel.shmmax=2147483648

    update-rc.d postgresql defaults
    /etc/init.d/postgresql start
fi

#PHP
cp /usr/src/php-5.5.12/php.ini-production /usr/local/php/etc/php.ini.default
cp /var/www/recipes/templates/php.ini /usr/local/php/etc/php.ini
cp /var/www/recipes/templates/php-fpm.conf /usr/local/php/etc/php-fpm.conf
cp /var/www/recipes/templates/php-fpm.sh /etc/init.d/php-fpm
export PATH=${PATH}:/usr/local/php/bin

chmod +x /etc/init.d/php-fpm

update-rc.d php-fpm defaults
/etc/init.d/php-fpm start

#Nginx
mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.default
mv /usr/local/nginx/conf/fastcgi_params /usr/local/nginx/conf/fastcgi_params.default
cp /var/www/recipes/templates/nginx.conf /usr/local/nginx/conf/nginx.conf
cp /var/www/recipes/templates/gzip_params /usr/local/nginx/conf/gzip_params
cp /var/www/recipes/templates/fastcgi_params /usr/local/nginx/conf/fastcgi_params
cp /var/www/recipes/templates/nginx.sh /etc/init.d/nginx

chmod +x /etc/init.d/nginx

update-rc.d nginx defaults
/etc/init.d/nginx start

#debug
cp /var/www/recipes/templates/debug.sh /usr/bin/debug

chmod +x /usr/bin/debug
debug &