#! /bin/sh
case "$1" in
     start)

          su -l pgsql -c 'postmaster -D /usr/local/postgres/data >> /usr/local/postgres/data/logfile &'
          echo -n "Postgres started"
     ;;

     stop)
          killall postmaster
     ;;

*)
echo "Usage: postgresql {start|stop}"
exit 1
esac

exit 0