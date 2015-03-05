#!/bin/sh

if [ -f /usr/include/zlib.h ]; then
    echo "ZLIB already installed"
else
    echo "Installing ZLIB"

    cd /usr/src
    wget http://zlib.net/zlib-1.2.8.tar.gz
    tar zxvf zlib-1.2.8.tar.gz
    cd zlib-1.2.8
    ./configure
    make && make install
fi