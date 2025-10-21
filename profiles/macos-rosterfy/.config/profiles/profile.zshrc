export SSH_KEY_PATH="${HOME}/.ssh/id_ed25519"
DEFAULT_USER="sam.huynh"

complete -o nospace -C /usr/local/bin/terraform terraform

# Composer path
export PATH="${HOME}/.composer/vendor/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Granted Assume to access to AWS resources on CLI
alias assume=". assume"

# Custom brewfile for Rosterfy profile
export HOMEBREW_BREWFILE="${HOME}/.config/profiles/Brewfile"

# Added by `rbenv init` on Thu Oct 16 11:11:52 AEDT 2025
eval "$(rbenv init - --no-rehash zsh)"

export ANDROID_HOME="${HOME}/Library/Android/sdk"
export PATH="${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${PATH}"
