#!/bin/bash

# Last time /etc/crontab was modified (in seconds)
last_modif=`ls -l /etc/crontab --time-style=+%s | cut -d' ' -f6`

# Current time (in seconds)
now=`date +%s`

# Dfference between the two (in seconds)
diff=`expr $now - $last_modif`

# Dfference between the two (in hours)
diff=`expr $diff / 3600`

# Dfference between the two (in days)
diff=`expr $diff / 24`

# Is the difference in days lower than 1 ?
# or
# Has the file been modified in the last 24 hours ?
if [ $diff -lt 1 ]; then
	`sudo sendmail root@debian < /etc/init.d/observer_cron_mail.txt`
fi
