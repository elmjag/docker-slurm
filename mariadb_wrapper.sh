#!/bin/bash

#
# script that makes sure there is an database 'slurm' user
#

# start DB-service
/usr/bin/mysqld_safe &
mysql_pid=$!


# wait until it's ready
until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

# create 'slurm' user
echo "DROP USER IF EXISTS slurm@localhost;"\
  "CREATE USER slurm@localhost IDENTIFIED BY 'password'; "\
  "GRANT ALL PRIVILEGES ON *.* TO 'slurm'@localhost;" \
  "FLUSH PRIVILEGES;" | mysql -u root


# for supervisord, don't terminate as longs
# as database daemon is running
wait $mysql_pid

