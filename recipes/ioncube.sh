#!/bin/sh
if [ -x /usr/local/ioncube ]; then
    echo "ioncube already installed"
else
    echo "Installing ioncube"

    cd /usr/src
    wget http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
    tar zxvf ioncube_loaders_lin_x86-64.tar.gz
    cp -R ioncube /usr/local
fi