. config-akash

SSH_PUBKEY0="ssh-rsa $SSH_PUBKEY root"

echo Building docker for Akash
echo SSH_PUBKEY0=$SSH_PUBKEY0
echo DOCKER_CONTAINER=$DOCKER_CONTAINER

docker build --build-arg SSH_PUBKEY0="$SSH_PUBKEY0" -t $DOCKER_CONTAINER .
