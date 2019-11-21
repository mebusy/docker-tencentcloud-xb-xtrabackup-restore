#!/bin/sh

mkdir -p /data
xbstream -x -C /data < /backup.xb
xtrabackup --decompress --target-dir=/data  --remove-original
xtrabackup --prepare  --target-dir=/data

grep -v -f /blacklist /data/backup-my.cnf >  /data/backup-my2.cnf
mv /data/backup-my2.cnf /data/backup-my.cnf

chown -R mysql:mysql /data
mysqld_safe --defaults-file=/data/backup-my.cnf --user=mysql --datadir=/data  --skip-grant-tables




# /bin/sh





