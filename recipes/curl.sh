#!/bin/sh

if which curl >/dev/null; then
    echo "cURL already installed"
else
    echo "Installing cURL"

    cd /usr/src
    wget http://curl.haxx.se/download/curl-7.27.0.tar.gz
    tar zxvf curl-7.27.0.tar.gz
    cd curl-7.27.0
    ./configure --prefix=/usr/local/curl/
    make && make install

    ln -s /usr/local/curl/bin/curl-config /usr/bin/curl-config
fi