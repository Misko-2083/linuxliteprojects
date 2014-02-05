#
# Regular cron jobs for the lite-control-center package
#
0 4	* * *	root	[ -x /usr/bin/lite-control-center_maintenance ] && /usr/bin/lite-control-center_maintenance
