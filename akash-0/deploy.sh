echo Configuring deploy.yaml
echo Your SSH_PUBKEY is $SSH_PUBKEY


. ./config-akash

echo TODO: verify SSH_PUBKEY

cat deploy-template-0.yaml | sed s/SSH_KEY_PLACEHOLDER/$SSH_PUBKEY/g > deploy.yaml


