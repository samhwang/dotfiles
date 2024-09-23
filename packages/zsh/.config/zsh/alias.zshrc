# Replace vim with nvim
if type nvim >/dev/null 2>&1; then
    alias vim='nvim'
fi

# Replace cat with bat
if type bat >/dev/null 2>&1; then
    alias cat="bat"
fi

# Replace ls with exa
if type eza >/dev/null 2>&1; then
    alias ls="eza"
fi

# Replace grep with ripgrep
if type rg >/dev/null 2>&1; then
    alias grep="rg"
fi

# Replace df with duf
if type duf >/dev/null 2>&1; then
    alias df="duf"
fi

# Preferred editor for local and remote sessions
export EDITOR='vim'

# system aliases
alias ll='ls -laF'

# git aliases
alias gs='git status '
alias got='git '
alias get='git '

# reload zsh modules
alias reload="source ~/.zshrc"
