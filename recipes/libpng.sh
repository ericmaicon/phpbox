#!/bin/sh

if [ -x /usr/local/include/libpng16 ]; then
    echo "PNG already installed"
else
    echo "Installing PNG"

    cd /usr/src
    wget http://78.108.103.11/MIRROR/ftp/png/src/history/libpng16/libpng-1.6.16.tar.gz
    tar zxvf libpng-1.6.16.tar.gz
    cd libpng-1.6.16
    ./configure
    make && make install
fi