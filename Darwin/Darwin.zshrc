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

# Composer path
export PATH="${HOME}/.composer/vendor/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Lyka Alias
# LYKAPROJECTSPATH="${PROJECTS}/lyka"
# alias sail="[ -f sail ] && bash sail || bash vendor/bin/sail"
# alias lara="cd ${LYKAPROJECTSPATH}/backend-api && sail up -d"
# alias cake="cd ${LYKAPROJECTSPATH}/lyka-backend && bin/cake server --host 0.0.0.0"
# alias vue="cd ${LYKAPROJECTSPATH}/lyka-frontend && php -S 0.0.0.0:8000"
# alias nuxt="cd ${LYKAPROJECTSPATH}/lyka-com-au && yarn nuxt"

# Private configurations
function load_private_config() {
    source "${OS_CONFIG_PATH}/private.zshrc"
}
load_private_config
