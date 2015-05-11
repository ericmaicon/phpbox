#!/bin/sh

php_fpm_BIN=/usr/local/php/sbin/php-fpm
php_fpm_CONF=/usr/local/php/etc/php-fpm.conf
php_fpm_PID=/usr/local/php/var/run/php-fpm.pid

php_opts="--fpm-config $php_fpm_CONF"

wait_for_pid () {
    try=0

    while test $try -lt 35 ; do

        case "$1" in
            'created')
            if [ -f "$2" ] ; then
                try=''
                break
            fi
            ;;

            'removed')
            if [ ! -f "$2" ] ; then
                try=''
                break
            fi
            ;;
        esac

        echo -n .
        try=`expr $try + 1`
        sleep 1

    done

}

case "$1" in
    start)
        echo -n "Starting php-fpm "

        $php_fpm_BIN $php_opts

        if [ "$?" != 0 ] ; then
            echo " failed"
            exit 1
        fi

        wait_for_pid created $php_fpm_PID

        if [ -n "$try" ] ; then
            echo " failed"
            exit 1
        else
            echo " done"
        fi
    ;;

    stop)
        echo -n "Gracefully shutting down php-fpm "

        if [ ! -r $php_fpm_PID ] ; then
            echo "warning, no pid file found - php-fpm is not running ?"
            exit 1
        fi

        kill -QUIT `cat $php_fpm_PID`

        wait_for_pid removed $php_fpm_PID

        if [ -n "$try" ] ; then
            echo " failed. Use force-exit"
            exit 1
        else
            echo " done"
        fi
    ;;

    *)
        echo "Usage: $0 {start|stop}"
        exit 1
    ;;

esac