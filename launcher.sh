#!/bin/sh



# Main directory of server
maindir=/home/samp/server/03x

# Directory with server logs
logdir=${maindir}/logs

# Directory with shell scripts
shelldir=${maindir}/shell

# Server log file name
logfile=server_log.txt

# Server executable
execfile="${maindir}/samp03svr"

# Other macro
timestamp=`date '+%d%m%y%H%M%S'`
logtimestamp=`date '+[%d/%m/%y %T]'`



cd ${shelldir}
./pidcollector.sh &
./cpumonitor.sh &
./memmonitor.sh &


cd ${maindir}
touch ${logfile}


echo "${logtimestamp} SA-MP autorestart shell started." >> ${logfile}

while true; do
	echo "${logtimestamp} Starting server..." >> ${logfile}
       ${execfile} >> ${logfile}
	echo "${logtimestamp} Server exited, restarting..." >> ${logfile}
       mv ${logfile} ${logdir}/server.log.${timestamp}
	sleep 5
done

echo "${logtimestamp} SA-MP autorestart shell stopped." >> ${logfile}