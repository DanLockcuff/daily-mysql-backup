# Daily MySql Backup Tool

This set of scripts/tools is what I use to make daily backups of an DB in a mysql instance. 

## Instructions

* Become root and lone repo into /root and run setup.sh as root.
-----

	sudo su root
	cd /root 
	git clone https://github.com/DanLockcuff/daily-mysql-backup.git
	cd daily-mysql-backup
	sudo sh setup.sh

-----
* This setup will create a log dir, /var/log/dailybackup/ and log file daily.log inside /var/log/dailybackup/
and symlink to mysql-daily cron file under cron.daily. This will also create a backup directory her. /backup/mysql_dump/ This is setup to run backups at 1am CST. The script will create a seperate backup for each database it finds and store them inside a timestamped folder under /backup/mysql_dump/ and retain a 15days of backups. 

* [Site](https://stratabyte.io) - StrataByte Site
* [@danlockcuff](https://twitter.com/danlockcuff) - Follow me on Twitter
* [Issues](https://github.com/DanLockcuff/daily-mysql-backup/issues) - Bug reports


## Download

* [Latest release](https://github.com/DanLockcuff/daily-mysql-backup/releases/latest)
* [All packages](https://github.com/DanLockcuff/daily-mysql-backup/releases)

## Help and Documentation

## Bug tracker

Have a bug or a request? Please open an issue [here](https://github.com/DanLockcuff/daily-mysql-backup/issues)

## Versioning

  StrataByte is using [Semantic Versioning](http://semver.org/)

## License, Copyright

  * Copyright (C) 2019 StrataByte. (https://stratabyte.io) All rights reserved.
  * Distributed under the GNU General Public License version 2 or later.
  
## Credits
