#!/bin/sh

if [ -x /usr/local/php ]; then
    echo "PHP already installed"
else
    echo "Installing PHP"

    cd /usr/src
    wget http://br2.php.net/distributions/php-5.5.12.tar.gz
    tar zxvf php-5.5.12.tar.gz
    cd php-5.5.12
    ./configure --prefix=/usr/local/php \
                --with-config-file-path=/usr/local/php/etc \
                --with-zlib \
                --with-zlib-dir=/usr \
                --with-curl=/usr/lib \
                --with-openssl \
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
                --with-icu-dir=/usr/local/ \
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
                --disable-debug \
                --with-mysql \
                --with-pdo-mysql \
                --with-mysqli=/usr/local/mysql/bin/mysql_config
    #Extra: --with-oci8=instantclient,/usr/local/oracle-client-12-1 \
    #       --with-pdo-oci=instantclient,/usr/local/oracle-client-11-2,10.2.0.4.0 \
    #       --with-pdo-dblib=/usr/local/freetds/ \
    make && make install
fi