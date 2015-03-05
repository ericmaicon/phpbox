PHPBox
====

## Introduction

This project automates the setup of a development and testing environment for PHP, using Vagrant and Shell script.

## Requirements

* [VirtualBox](https://www.virtualbox.org) 
* [Vagrant](http://vagrantup.com)

## Setup

    $ git clone https://github.com/ericmaicon/phpbox.git
    $ cd phpbox
    $ vagrant up

## The Box contains

- Debian 7.6 64bit

- LibXML
- Curl
- OpenSSL
- zLib
- ncurses
- pkg-config
- libXpm
- XSTL
- JPEG
- Free Type
- libPNG
- mcrypt
- PCRE
- IMAP
- ICU

- Komodo Xdebug
- Komodo proxy
- Ioncube
- PHP 5.5
```
--prefix=/usr/local/php \
--with-config-file-path=/usr/local/php/etc \
--with-zlib \
--with-zlib-dir=/usr \
--with-curl=/usr/lib \
--with-openssl=/usr/bin/openssl/ \
--with-pdo-pgsql \
--with-jpeg-dir=/usr \
--with-freetype-dir=/usr \
--with-png-dir=/usr \
--with-gd \
--with-mcrypt \
--with-pcre-regex \
--with-imap=/usr/local/imap \
--with-imap-ssl=/usr \
--with-mcrypt=/usr/local/mcrypt/ \
--with-icu-dir=/usr \
--with-libxml-dir=/opt/xml2 \
--with-pdo-sqlite \
--with-gd \
--with-gettext \
--with-kerberos \
--with-xsl \
--with-libdir=/lib/x86_64-linux-gnu \
--enable-mbstring \
--enable-fpm \
--enable-soap \
--enable-calendar \
--enable-sockets \
--enable-zip \
--enable-gd-native-ttf \
--enable-bcmath \
--enable-exif \
--enable-ftp \
--enable-gd-native-ttf \
--enable-intl \
--enable-libxml \
--disable-mbregex \
--disable-debug
```

- PostgreSQL
- Nginx

## TODO

- Composer
- PHPUnit
- MySQL
- Mongo
- FreeTDS
- Instant Client

- PHP
```
--with-oci8=instantclient,/usr/local/oracle-client-12-1 \
--with-pdo-oci=instantclient,/usr/local/oracle-client-11-2,10.2.0.4.0 \
--with-pdo-dblib=/usr/local/freetds/ \
--with-mysql \
--with-pdo-mysql \
--with-mysqli=/usr/local/mysql/bin/mysql_config
--with-xpm-dir=/usr \
```