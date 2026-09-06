# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:$HOME/.docker/bin"
# End of Docker Desktop section.

if [[ $(arch) == 'arm64' ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)";
else
    eval "$(/usr/local/bin/brew shellenv)";
fi
