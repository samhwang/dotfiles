plugins=(osx z zsh_reload zsh-completions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Load iterm2 config
source "$DOTFILEPATH/Darwin/iterm2.zsh"

# Software Packages, Language and Environment
# PATH for Composer global stuff
export PATH="${HOME}/.composer/vendor/bin:$PATH"

# PATH for Go
export GOPATH="${HOME}/.go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Load NVM
source "$GENERALCONFIG/load_nvm.sh"

# Load PyPi packages
export PATH="${HOME}/Library/Python/3.7/bin:$PATH"

# PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# shell command completion for gcloud
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Enable Byobu
if type byobu > /dev/null 2>&1; then
  _byobu_sourced=1 . `which byobu-launch` 2>/dev/null || true
fi