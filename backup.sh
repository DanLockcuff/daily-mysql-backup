#! /bin/bash
echo "Starting the backup process"
##Creates timestamp on each backup to facilitate easy automated removal.
TIMESTAMP=$(date +"%F_%H-%M-%S")
##Define backup dir.
BACKUP_DIR="/backup/mysql_dump/$TIMESTAMP"
##Define user.
MYSQL_USER="root"
##Define mysql location, generally not needed. 
#MYSQL=/usr/bin/mysql
##Defines mysql password, this should not be used unless you have a dedicated user with specific perms. Use the .my.cnf file over this for security. 
#MYSQL_PASSWORD="pi8Eqd$tt9ksuvB"
##Define mysqldump location.
#MYSQLDUMP=/usr/bin/mysqldump

##This will search for any backup older than 15 days and delete them.
echo "Cleaning up old databases greater than 15 days old"
find /backup/mysql_dump/ -maxdepth 1 -type d -mtime +15 -exec rm -Rf {} \;
## This creates the dir for the next backup. 
echo "Creating new backup dir"
mkdir -p "$BACKUP_DIR/"
##This searches for all the databases accessible to the root or above user and create an array.
echo "Searching for databases to backup"
databases=`mysql --defaults-file=/root/.my.cnf -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`

##This command takes each database found in the array and backs them up to the specified folder and compresses them to save space. 
for db in $databases; do
	echo "Backing up $db"
mysqldump --defaults-file=/root/.my.cnf --databases $db | gzip > "$BACKUP_DIR/$db.sql.gz"
echo "Backup Completed on $(date +"%F_%H-%M-%S")"
done