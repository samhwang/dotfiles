# Load Sheldon

if type sheldon > /dev/null; then
    eval "$(sheldon source)";
    source <(sheldon completions --shell zsh)
fi
