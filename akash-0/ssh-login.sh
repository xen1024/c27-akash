. ./config-akash

echo "usage: ./ssh-login.sh root@localhost"

HOST=$1

if [ $# -eq 0 ]; then
 HOST=root@localhost
fi

ssh $HOST -p $SSH_PORT -o StrictHostKeyChecking=no
