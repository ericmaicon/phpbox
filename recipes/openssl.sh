#!/bin/sh

#http://stackoverflow.com/questions/9856812/apache-2-4-1-undefined-reference-to-sslv2-client-method
if [ -x /usr/ssl ]; then
    echo "OPENSSL already installed"
else
    echo "Installing OPENSSL"

    cd /usr/src
    wget http://www.openssl.org/source/openssl-0.9.8k.tar.gz
    tar zxvf openssl-0.9.8k.tar.gz
    cd openssl-0.9.8k
    ./config shared --prefix=/usr --openssldir=/usr/ssl no-asm
    make && make install
fi