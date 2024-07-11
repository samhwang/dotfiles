# Load OMZ modules
plugins=(
  command-not-found
  z
  history-substring-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# LazyGit & LazyDocker
alias lg="lazygit"
alias lzd="lazydocker"

alias sso-vait="aws ssm start-session --target i-09bfcbbea7ac38621 --profile vait"
