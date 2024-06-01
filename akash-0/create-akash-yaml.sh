. ./config-akash

echo Configuring deploy.yaml
echo Your SSH_PUBKEY is $SSH_PUBKEY

echo TODO: verify SSH_PUBKEY
echo "TODO: new args --no-gpu and --gpu A100 flags"
echo "TODO: new args --miner (default) --validator"

. lib.sh

#echo DOCKER_CONTAINER=$DOCKER_CONTAINER
#echo NETUID=$NETUID
#echo NETWORK=$NETWORK
#echo WALLET_NAME=$WALLET_NAME
#echo WALLET_HOTKEY=$WALLET_HOTKEY
dump_variables

cat deploy-template-0.yaml | sed -e "s|SSH_KEY_PLACEHOLDER|$SSH_PUBKEY|g" \
-e "s|DOCKER_CONTAINER_PLACEHOLDER|$DOCKER_CONTAINER|g" \
-e "s|MINER_PLACEHOLDER|$MINER|g" \
-e "s|VALIDATOR_PLACEHOLDER|$VALIDATOR|g" \
-e "s|NETUID_PLACEHOLDER|$NETUID|g" \
-e "s|NETWORK_PLACEHOLDER|$NETWORK|g" \
-e "s|WALLET_NAME_PLACEHOLDER|$WALLET_NAME|g" \
-e "s|WALLET_HOTKEY_PLACEHOLDER|$WALLET_HOTKEY|g" > deploy.yaml

