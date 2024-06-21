#!/bin/sh

LLFILE=/app/STATS.sh

env > ~/env11.log

bt () {
 echo "> btcli $@"
 btcli $@
 echo
}

STARTED_DATE=`date`

while [ : ]
do
  LAST_UPDATE="Last update: `date`"
  NODE_PROCS=`ps -aux|grep "[n]ode "`

  echo "
  # SYS [
  # LAST UPDATE [
  Started at $STARTED_DATE
  $LLFILE $LAST_UPDATE
  # LAST UPDATE ]
  # akash-config [
`cat ~/.config-akash`
  # akash-config ]
  # SSHD [
`ps -A|grep sshd`
  # SSHD ]
  # ENV [
  `env`
  # ENV ]
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
`nvcc --version 2>&1`
  # NVIDIA ]
  
  # SYS ]
  " > $LLFILE


  sleep 10
done
