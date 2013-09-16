#!/bin/sh



serverdir=/home/samp/server
logfile=${serverdir}/logs/system/shell.log





killall start.sh
killall cpu.sh
killall mem.sh
killall samp03svr
killall announce

echo "`date '+[%d/%m/%y %T]'` SA-MP autorestart shell by BJIADOKC deactivated!" >> ${logfile}