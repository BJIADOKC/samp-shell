#!/bin/sh



serverdir=/home/samp/server
logfile=${serverdir}/logs/system/cpu.log
pid=`pidof samp03svr | awk {'print $1;'}`




touch ${logfile}

sleep 5

while true; do
	echo "`date '+[%d/%m/%y %T]'` Current CPU usage: `ps aux | grep ${pid} | grep grep -v | awk {'print $3;'}`%" >> ${logfile}

	sleep 60
done