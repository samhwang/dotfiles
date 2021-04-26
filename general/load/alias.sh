# Preferred editor for local and remote sessions
EDITOR='code --wait'
if [[ -n $SSH_CONNECTION ]]; then
  EDITOR='vim'
fi
export EDITOR

# system aliases
alias ll='ls -laF'
alias reload='src'
alias zshconfig="$EDITOR $GENERALCONFIG/.zshrc"
alias dotfileconfig="$EDITOR $DOTFILEPATH"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# git aliases
alias gs='git status '
alias got='git '
alias get='git '