#!/bin/sh

if [ -x /usr/local/lib/icu ]; then
    echo "ICU already installed"
else
    echo "Installing ICU"

    cd /usr/src
    wget http://download.icu-project.org/files/icu4c/4.8.1.1/icu4c-4_8_1_1-src.tgz
    tar -xvf icu4c-4_8_1_1-src.tgz
    cd icu/source
    ./configure
    make && make install
fi