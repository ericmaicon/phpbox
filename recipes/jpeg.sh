#!/bin/sh

if [ -f /usr/local/include/jpeglib.h ]; then
    echo "JPEG already installed"
else
    echo "Installing JPEG"

    cd /usr/src
    wget http://fossies.org/linux/misc/jpegsrc.v9a.tar.gz
    tar zxvf jpegsrc.v9a.tar.gz
    cd jpeg-9a
    ./configure
    make && make install
fi