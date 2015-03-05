#!/bin/sh

if [ -x /usr/local/include/libxml2 ]; then
    echo "LIBXML already installed"
else
    echo "Installing LIBXML"

    cd /usr/src
    wget http://xmlsoft.org/sources/libxml2-2.7.2.tar.gz
    tar zxvf libxml2-2.7.2.tar.gz
    cd libxml2-2.7.2
    ./configure
    make && make install
fi