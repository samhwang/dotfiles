complete -o nospace -C /usr/local/bin/terraform terraform

# Composer path
export PATH="${HOME}/.composer/vendor/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Granted Assume to access to AWS resources on CLI
alias assume=". assume"

# Custom brewfile for Rosterfy profile
export HOMEBREW_BREWFILE="${HOME}/.config/profiles/Brewfile"
