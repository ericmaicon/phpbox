#!/bin/sh

if [ -x /usr/local/imap ]; then
    echo "IMAP already installed"
else
    echo "Installing IMAP"

    cd /usr/src
    wget ftp://ftp.cac.washington.edu/imap/imap-2007f.tar.gz
    tar zxvf imap-2007f.tar.gz
    cd /usr/local/
    mv /usr/src/imap-2007f /usr/local/imap
    cd imap
    make lr5 EXTRACFLAGS=-fPIC
    mkdir lib
    mkdir include
    cp c-client/*.c lib/
    cp c-client/*.h include/
    cp c-client/c-client.a lib/libc-client.a
fi