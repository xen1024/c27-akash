#!/bin/sh

LLFILE=/app/STATS.sh

while [ : ]
do
  LAST_UPDATE="Last update: `date`"
  NODE_PROCS=`ps -aux|grep "[n]ode "`

  echo "
  # SYS [
  # LAST UPDATE [
  $LLFILE $LAST_UPDATE
  # LAST UPDATE ]
  # TOP [
`ps -A -o pid,ppid,%mem,%cpu,lstart,args --sort=-%cpu|head`
  # TOP ]
  # DEBUG [
$NODE_PROCS
  # DEBUG ]
  # BUILD & RUN [
`ps -aux|grep [m]iner || echo -`
`ps -aux|grep [v]alidator || echo -`
`ps -aux|grep [b]tcli || echo -`
`ps -aux|grep [b]encmark || echo -`
  # BUILD & RUN ]
  # DRIVE [
`df -h`
  # DRIVE ]
  # NVIDIA [
`nvidia-smi 2>&1; echo result $`
  # NVIDIA ]

  # SYS ]
  " > $LLFILE


  sleep 10
done
