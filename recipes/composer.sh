#!/bin/sh

cd /usr/src
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer
chmod a+x /usr/bin/composer