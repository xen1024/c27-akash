# Import config
. ~/.config-akash

echo Configuring ssh key
echo "ssh-rsa $SSH_PUBKEY root" > /root/.ssh/authorized_keys
