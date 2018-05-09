#!/bin/bash

set -e
set -u
source ./mariadb-functions.sh

# User-provided env variables
MARIADB_USER=${MARIADB_USER:="sa_webbudget"}
MARIADB_PASS=${MARIADB_PASS:-$(pwgen -s 12 1)}

# Other variables
VOLUME_HOME="/var/lib/mysql"
MARIADB_LOG="/var/log/mariadb/mariadb.log"
MYSQLD_PID_FILE="$VOLUME_HOME/mysql.pid"

# Trap INT and TERM signals to do clean DB shutdown
trap terminate_db SIGINT SIGTERM

install_db
tail -F $MARIADB_LOG & # tail all db logs to stdout 

/usr/bin/mysqld_safe & # Launch DB server in the background
MYSQLD_SAFE_PID=$!

wait_for_db
show_db_status
create_user
create_db

echo "MariaDB is now running!"

# Do not exit this script untill mysqld_safe exits gracefully
#wait $MYSQLD_SAFE_PID
