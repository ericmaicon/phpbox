#!/bin/sh

if [ -x /usr/local/include/freetype2 ]; then
    echo "freetype already installed"
else
    echo "Installing freetype"

    cd /usr/src
    wget http://download.savannah.gnu.org/releases/freetype/freetype-2.5.3.tar.gz
    tar zxvf freetype-2.5.3.tar.gz
    cd freetype-2.5.3
    ./configure
    make && make install
fi