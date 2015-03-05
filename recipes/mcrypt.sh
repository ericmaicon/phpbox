#!/bin/sh

if [ -x /usr/local/lib/libmcrypt ]; then
    echo "mcrypt already installed"
else
    echo "Installing mcrypt"

    cd /usr/src
    wget http://softlayer.dl.sourceforge.net/sourceforge/mcrypt/libmcrypt-2.5.8.tar.gz
    tar -zxvf libmcrypt-2.5.8.tar.gz
    cd libmcrypt-2.5.8
    ./configure --prefix=/usr/local  --disable-posix-threads --enable-dynamic-loading
    make && make install
fi