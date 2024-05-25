# ssh root@localhost -o StrictHostKeyChecking=no

. ./config-akash

echo Run docker $DOCKER_CONTAINER with SSH $SSH_PORT

docker run -it -p 22:$SSH_PORT $DOCKER_CONTAINER
