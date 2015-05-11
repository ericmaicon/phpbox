#!/bin/sh

if [ -x /usr/local/mysql ]; then
    echo "MySQL already installed"
else
    echo "Installing MySQL"

    #https://dev.mysql.com/doc/refman/5.1/en/binary-installation.html
    groupadd mysql
    useradd -r -g mysql mysql
    cd /usr/src/
    wget http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.24-linux-glibc2.5-x86_64.tar.gz
    tar zxvf mysql-5.6.24-linux-glibc2.5-x86_64.tar.gz
    mv mysql-5.6.24-linux-glibc2.5-x86_64/ /usr/local/mysql
    cd /usr/local/mysql/
    chown -R mysql .
    chgrp -R mysql .
    scripts/mysql_install_db --user=mysql
    chown -R root .
    chown -R mysql data
    cp support-files/my-default.cnf /etc/my.cnf
    bin/mysqld_safe --user=mysql &
    cp support-files/mysql.server /etc/init.d/mysql
fi