complete -o nospace -C /usr/local/bin/terraform terraform

alias sso-vait="aws ssm start-session --target i-09bfcbbea7ac38621 --profile vait"

export LOCALSTACK_VOLUME_DIR="${HOME}/Library/Caches/localstack/volume"
