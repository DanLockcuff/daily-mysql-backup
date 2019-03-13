#! /bin/bash

##Adding execute to the backup script. 
echo "Making the backup script executable"
chmod u+x /root/daily-mysql-backup/backup.sh

##This creates the backup dir.
echo "Creating the backup dir if it doesn't exist"
[ -d /backup/mysql_dump/ ] || mkdir -p /backup/mysql_dump/

##Create log directory
echo "Creating log file dir if it doesn;t exist"
[ -d /var/log/dailybackup/ ] || mkdir -p /var/log/dailybackup/

#Create log file
echo "Creating log file if it doesn't exist"
[ -f /var/log/dailybackup/daily.log ] || touch /var/log/dailybackup/daily.log

#Create symlink to cron file.
echo "Lets create the symlink to the cron file"
	if [ -f /etc/cron.daily/mysql-daily ]
	then
	    echo "Looks like the file already exists, let me re-create it for you"
	    rm -Rf /etc/cron.daily/mysql-daily
	    echo "Re-creating symlink to daily cron"
	    ln -s /root/daily-mysql-backup/mysql-daily /etc/cron.daily/mysql-daily
	
	else
		echo "Creating symlink to daily cron"
	    ln -s /root/daily-mysql-backup/mysql-daily /etc/cron.daily/mysql-daily
	fi 
#Setting perms on cron 
echo "Setting cron permissions"
chmod 755 /etc/cron.daily/mysql-daily

echo "Looks like were good to go"



