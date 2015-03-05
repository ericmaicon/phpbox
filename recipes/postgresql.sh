#!/bin/sh

if [ -x /usr/local/postgres ]; then
    echo "PostgreSQL already installed"
else
    echo "Installing PostgreSQL"

    cd /usr/src/
    wget http://ftp.postgresql.org/pub/source/v9.1.1/postgresql-9.1.1.tar.gz
    tar zxvf postgresql-9.1.1.tar.gz
    cd postgresql-9.1.1
    ./configure --without-readline --prefix=/usr/local/postgres --bindir=/usr/bin --sysconfdir=/etc/postgres  --without-zlib
    make && make install
fi