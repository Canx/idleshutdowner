#
# Regular cron jobs for the idleshutdowner package
#
0 4	* * *	root	[ -x /usr/bin/idleshutdowner_maintenance ] && /usr/bin/idleshutdowner_maintenance
