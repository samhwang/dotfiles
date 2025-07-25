# Preferred editor for local and remote sessions
export EDITOR='vim'

# Replace vim with nvim
if type nvim > /dev/null; then
    alias vim='nvim'
    export EDITOR='nvim'
fi

# Replace cat with bat
if type bat > /dev/null; then
    alias cat="bat"
fi

# Replace ls with exa
if type eza > /dev/null; then
    alias ls="eza"
fi

# Replace grep with ripgrep
if type rg > /dev/null; then
    alias grep="rg"
fi

# Replace df with duf
if type duf > /dev/null; then
    alias df="duf"
fi

# system aliases
alias ll='ls -laF'

# git aliases
alias gs='git status '
alias got='git '
alias get='git '

# reload zsh modules
alias reload="source ~/.zshrc"
