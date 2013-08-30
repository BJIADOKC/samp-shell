#!/bin/sh



maindir=/home/samp/server/03x
logdir=${maindir}/logs

cpulog=${logdir}/cpu.log
pidfile=${maindir}/system/samp.pid

pid=`cat ${pidfile}`



while true; do
	rm ${cpulog}
	touch ${cpulog}
	ps aux | grep ${pid} | awk {'print $3;'} >> ${cpulog}
	sleep 60
done