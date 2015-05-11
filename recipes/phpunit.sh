#!/bin/sh

cd /usr/src
curl -OL https://phar.phpunit.de/phpunit.phar
mv phpunit.phar /usr/bin/phpunit
chmod a+x /usr/bin/phpunit