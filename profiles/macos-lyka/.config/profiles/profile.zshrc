complete -o nospace -C /usr/local/bin/terraform terraform

# Load herd injected configs
source "${PROFILE_CONFIG_PATH}/herd.zshrc"

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

export LOCALSTACK_VOLUME_DIR="${HOME}/Library/Caches/localstack/volume"

# Granted Assume to access to AWS resources on CLI
alias assume=". assume"

# Custom brewfile for Lyka profile
export HOMEBREW_BREWFILE="${HOME}/.config/profiles/Brewfile"
