#!/bin/sh



serverdir=/home/samp/server
logfile=${serverdir}/logs/system/shell.log
serverlog=${serverdir}/server_log.txt
servercfg=${serverdir}/server.cfg





cd ${serverdir}

touch ${logfile}
touch ${serverlog}
rm ${serverlog}
touch ${serverlog}

echo "`date '+[%d/%m/%y %T]'` SA-MP autorestart shell by BJIADOKC activated!" >> ${logfile}

while true; do
	echo "`date '+[%d/%m/%y %T]'` Starting server on port `cat ${servercfg} | grep port | awk {'print $2;'}` with maxplayers `cat ${servercfg} | grep maxplayers | awk {'print $2;'}`" >> ${logfile}

	./shell/cpu.sh &
	./shell/mem.sh &
	./samp03svr >> /dev/null

	echo "`date '+[%d/%m/%y %T]'` Server shutted down, restarting..." >> ${logfile}

	killall cpu.sh
	killall mem.sh
	killall announce

	sleep 10
done