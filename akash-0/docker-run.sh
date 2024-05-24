# ssh root@localhost -o StrictHostKeyChecking=no

. ./config-akash

SSH_PORT=22

echo Run docker $DOCKER_CONTAINER with SSH $SSH_PORT

docker run -it -p 22:22 $DOCKER_CONTAINER
