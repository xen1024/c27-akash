. config-akash

SSH_PUBKEY0="ssh-rsa $SSH_PUBKEY root"
SSH_PUBKEY1="ssh-rsa $SSH_PUBKEY1 root"

echo Building docker for Akash
echo SSH_PUBKEY0=$SSH_PUBKEY0
echo SSH_PUBKEY1=$SSH_PUBKEY1
echo DOCKER_CONTAINER=$DOCKER_CONTAINER

docker build --build-arg SSH_PUBKEY0="$SSH_PUBKEY0" --build-arg SSH_PUBKEY1="$SSH_PUBKEY1" -t $DOCKER_CONTAINER .
