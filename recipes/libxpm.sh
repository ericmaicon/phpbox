#!/bin/sh

cd /usr/src
wget ftp://ftp.freedesktop.org/pub/xorg/development/X11R7.0-RC4/lib/libXpm-3.5.4.2.tar.gz
tar zxvf libXpm-3.5.4.2.tar.gz
cd libXpm-3.5.4.2
./configure
make && make install