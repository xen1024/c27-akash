# The Goals
# - dynamic ssh key
# - akash-cli
# - one-click script

# Create keys

echo Create keys

export AKASH_KEY_NAME=wa1
export AKASH_KEYRING_BACKEND=os

provider-services keys add $AKASH_KEY_NAME

# Configure

export AKASH_ACCOUNT_ADDRESS="$(provider-services keys show $AKASH_KEY_NAME -a)"

echo $AKASH_ACCOUNT_ADDRESS

export AKASH_NET="https://raw.githubusercontent.com/akash-network/net/main/mainnet"

export AKASH_VERSION="$(curl -s https://api.github.com/repos/akash-network/provider/releases/latest | jq -r '.tag_name')"

echo $AKASH_VERSION
# v0.6.2

export AKASH_CHAIN_ID="$(curl -s "$AKASH_NET/chain-id.txt")"

export AKASH_NODE="$(curl -s "$AKASH_NET/rpc-nodes.txt" | shuf -n 1)"

echo $AKASH_NODE $AKASH_CHAIN_ID $AKASH_KEYRING_BACKEND

export AKASH_GAS=auto
export AKASH_GAS_ADJUSTMENT=1.25
export AKASH_GAS_PRICES=0.025uakt
export AKASH_SIGN_MODE=amino-json

# AKASH Balance

provider-services query bank balances --node $AKASH_NODE $AKASH_ACCOUNT_ADDRESS

#balances:
#- amount: "1000000"
#  denom: uakt
#pagination:
#  next_key: null
#  total: "0"

# AKASH Cert

provider-services tx cert generate client --from $AKASH_KEY_NAME

provider-services tx cert publish client --from $AKASH_KEY_NAME

# Deploy 1

provider-services tx deployment create deploy.yml --from $AKASH_KEY_NAME

# Deploy 2

export AKASH_DSEQ=16342906

export AKASH_OSEQ=1
export AKASH_GSEQ=1

echo $AKASH_DSEQ $AKASH_OSEQ $AKASH_GSEQ

provider-services query market bid list --owner=$AKASH_ACCOUNT_ADDRESS --node $AKASH_NODE --dseq $AKASH_DSEQ --state=open

# file > akash-reply.yaml

# select provider="akash1.." from the list

export AKASH_PROVIDER=akash1qk9dg3kr3jx6q5l2uf7g7mm8st2mr8ylfakepy

provider-services tx market lease create --dseq $AKASH_DSEQ --provider $AKASH_PROVIDER --from $AKASH_KEY_NAME

provider-services query market lease list --owner $AKASH_ACCOUNT_ADDRESS --node $AKASH_NODE --dseq $AKASH_DSEQ

provider-services send-manifest deploy.yml --dseq $AKASH_DSEQ --provider $AKASH_PROVIDER --from $AKASH_KEY_NAME

provider-services lease-status --dseq $AKASH_DSEQ --from $AKASH_KEY_NAME --provider $AKASH_PROVIDER
