#! /bin/bash

##Adding execute to the backup script. 
chmod u+x /root/daily-mysql-backup/backup.sh

##This creates the backup dir.
mkdir -p /backup/mysql_dump/

#This will create the driectories and place the files where they need to be.
logdir = /var/log/dailybackup/

#Create log directory
echo "Creating log file directory"
mkdir -p $logdir

#Create log file
echo "Creating log file"
touch $logdir/daily.log

#Create symlink to cron file.
echo "Creating symlink to daily cron"
ln -s /root/daily-mysql-backup/mysql-daily /etc/cron.daily/mysql-daily

