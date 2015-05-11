#!/bin/sh

bindir=/usr/local/mysql/bin
datadir=/usr/local/mysql/data
mysqld_pid_file_path=/usr/local/mysql/data/mysql.pid

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
        echo -n "Starting mysql "

        $bindir/mysqld_safe --user=mysql --datadir="$datadir" --pid-file="$mysqld_pid_file_path" &

        if [ "$?" != 0 ] ; then
            echo " failed"
            exit 1
        fi

        wait_for_pid created $mysqld_pid_file_path

        if [ -n "$try" ] ; then
            echo " failed"
            exit 1
        else
            echo " done"
        fi
    ;;

    stop)
        echo -n "Gracefully shutting down mysql "

        if [ ! -r $mysqld_pid_file_path ] ; then
            echo "warning, no pid file found - MySQL is not running ?"
            exit 1
        fi

        kill -QUIT `cat $mysqld_pid_file_path`

        wait_for_pid removed $mysqld_pid_file_path

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