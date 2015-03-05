#!/bin/sh

if [ -x /usr/local/include/ncurses ]; then
    echo "NCurses already installed"
else
    echo "Installing NCurses"

    cd /usr/src
    wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
    tar zxvf ncurses-5.9.tar.gz
    cd ncurses-5.9
    ./configure --prefix=/usr/local
    make && make install
fi