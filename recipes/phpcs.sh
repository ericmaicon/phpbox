#!/bin/sh

cd /usr/src
curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
mv phpcs.phar /usr/bin/phpcs
chmod a+x /usr/bin/phpcs