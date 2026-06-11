export SSH_KEY_PATH="${HOME}/.ssh/id_ed25519"
DEFAULT_USER="sam.huynh"

complete -o nospace -C /usr/local/bin/terraform terraform

# Composer path
export PATH="${HOME}/.composer/vendor/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Granted Assume to access to AWS resources on CLI
alias assume=". assume"

# Added by `rbenv init` on Thu Oct 16 11:11:52 AEDT 2025
eval "$(rbenv init - --no-rehash zsh)"

export ANDROID_HOME="${HOME}/Library/Android/sdk"
export PATH="${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${PATH}"

function bastion() {
    # This function assumes that AWS Profile and kubectl are already setup.
    local ctx

    if [[ -n "$1" ]]; then
        ctx="$1"
        kubectx "$ctx"
    else
        ctx="$(kubectx -c 2>/dev/null)"
        if [[ -z "$ctx" ]]; then
            echo "Error: No kubectx set. Pass one as argument." >&2
            echo "Usage: bastion [context-name]" >&2
            return 1
        fi
    fi

    echo "Using kubectx: $ctx"
    kubectl port-forward -n bastion service/bastion 2222:22
}
