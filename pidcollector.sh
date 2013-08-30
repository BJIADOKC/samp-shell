#!/bin/sh



sleep 5


maindir=/home/samp/server/03x
systemdir=${maindir}/system

execfile=samp03svr
pidfile=${systemdir}/samp.pid

pid=`pidof ${execfile} | awk {'print $1;'}`



rm ${pidfile}
touch ${pidfile}
pidof ${execfile} | awk {'print $1;'} >> ${pidfile}

echo "SA-MP server with pid ${pid} found"
