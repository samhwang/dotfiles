complete -o nospace -C /usr/local/bin/terraform terraform

# LazyGit & LazyDocker
alias lg="lazygit"
alias lzd="lazydocker"

alias sso-vait="aws ssm start-session --target i-09bfcbbea7ac38621 --profile vait"

# Private configurations
PRIVATE_CONFIG="${ZSHCONFIG}/private.zshrc"
[ -f "${PRIVATE_CONFIG}" ] && source "${PRIVATE_CONFIG}"