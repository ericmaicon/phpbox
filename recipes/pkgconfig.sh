#!/bin/sh

if which pkg-config >/dev/null; then
    echo "pkg-config already installed"
else
    echo "Installing pkg-config"

    cd /usr/src
    curl http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz -o pkgconfig.tgz
    tar -zxf pkgconfig.tgz
    cd pkg-config-0.28
    ./configure --with-internal-glib
    make && make install
fi