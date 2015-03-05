#!/bin/sh

if [ -x /usr/local/include/libxslt ]; then
    echo "libXSLT already installed"
else
    echo "Installing libXSLT"

    cd /usr/src
    wget ftp://xmlsoft.org/libxml2/libxslt-git-snapshot.tar.gz
    tar zxvf libxslt-git-snapshot.tar.gz
    cd libxslt-1.1.28
    ./configure
    make && make install
fi