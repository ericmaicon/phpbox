#!/bin/sh

if [ -x /usr/local/komodo ]; then
    echo "komodo already installed"
else
    echo "Installing komodo"

    cd /usr/src/
    wget http://downloads.activestate.com/Komodo/releases/8.5.4/remotedebugging/Komodo-PHPRemoteDebugging-8.5.4-86985-linux-x86_64.tar.gz -O debug.tar.gz
    tar zxvf debug.tar.gz

    mv Komodo-PHPRemoteDebugging-8.5.4-86985-linux-x86_64 /usr/local/komodo

    wget http://downloads.activestate.com/Komodo/releases/archive/4.x/4.4.1/remotedebugging/Komodo-PythonRemoteDebugging-4.4.1-20896-linux-x86.tar.gz -O komodo.tar.gz
    tar zxvf komodo.tar.gz
    mv /usr/src/Komodo-PythonRemoteDebugging-4.4.1-20896-linux-x86/ /usr/local/pydbgpproxy
fi