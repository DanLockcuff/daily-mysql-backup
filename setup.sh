#! /bin/bash

##Adding execute to the backup script. 
chmod u+x /root/daily-mysql-backup/backup.sh

##This creates the backup dir.
mkdir -p /backup/mysql_dump/

##Create log directory
echo "Creating log file directory"
mkdir -p /var/log/dailybackup/

#Create log file
echo "Creating log file"
touch /var/log/dailybackup/daily.log

#Create symlink to cron file.
echo "Creating symlink to daily cron"
ln -s /root/daily-mysql-backup/mysql-daily /etc/cron.daily/mysql-daily

