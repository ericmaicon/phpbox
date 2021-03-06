#!/bin/sh

if [ -f /usr/local/include/pcre.h ]; then
    echo "PCRE already installed"
else
    echo "Installing PCRE"

    cd /usr/src
    wget http://www-cs.stanford.edu/pub/exim/pcre/pcre-8.35.tar.gz
    tar zxvf pcre-8.35.tar.gz
    cd pcre-8.35
    ./configure
    make && make install
fi