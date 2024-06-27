
usage () {
  echo "usage: ./update-debug-ports.sh <user@host> <ssh_port> <PORT0> <PORT1> <PORT2> <PORT3> <EXTIP>"
}

if [ $# -le 6 ]; then
  usage
  exit 1
fi

HOST=${1:-root@localhost}
#PORT=${2:-22}
PORT=${2:+-P $2}

PORT0=$3
PORT1=$4
PORT2=$5
PORT3=$6
EXTIP=$7

echo "export PORT0=$PORT0" > config-debug
echo "export PORT1=$PORT1" >> config-debug
echo "export PORT2=$PORT2" >> config-debug
echo "export PORT3=$PORT3" >> config-debug
echo "export EXTIP=$EXTIP" >> config-debug

TO=$HOST:

set -x
scp $PORT -o StrictHostKeyChecking=no config-debug $TO

exit 0

# NOT USED
#
#set -x
#
#ssh -o SendEnv=PORT0 $HOST -p $PORT bash -s << 'ENDSSH'
#echo "Running remote command..."
#ls -l ~
#echo "PORT0=$PORT0 $PWD $HOST" > ~/config-debug
#echo PORT1=$PORT1 >> ~/config-debug
#echo PORT2=$PORT2 >> ~/config-debug
#echo PORT3=$PORT3 >> ~/config-debug
#
#echo PORT3=$(PORT3)
#cat ~/config-debug
#ENDSSH
