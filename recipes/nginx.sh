#!/bin/sh

if [ -x /usr/local/nginx ]; then
    echo "nginx already installed"
else
    echo "Installing nginx"

    cd /usr/src
    wget http://nginx.org/download/nginx-1.1.6.tar.gz
    tar -zxvf nginx-1.1.6.tar.gz
    cd nginx-1.1.6
    ./configure --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --with-http_stub_status_module
    make && make install
fi