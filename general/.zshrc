# Make copying much faster and disable highlight
DISABLE_MAGIC_FUNCTIONS=true
zle_highlight=('paste:none')

# Setting up environment
export PROJECTS="${ZDOTDIR:-${HOME}}/projects"
export LANG=en_US.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export TERM="xterm-256color"
export ZSH="$PROJECTS/dotfiles/general/oh-my-zsh"
ZSH_CUSTOM="$PROJECTS/dotfiles/general/oh-my-zsh-custom"

# Cowfiles directory
export COWPATH="$PROJECTS/cowfiles:$COWPATH"

# Theme
DEFAULT_USER='samhwang'
ZSH_THEME="powerlevel10k/powerlevel10k"
source "$PROJECTS/dotfiles/general/p10k-config.zsh"

# Load oh-my-zsh specific distro config
source "$PROJECTS/dotfiles/`uname`/.zshrc-`uname`"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# system aliases
alias ll='ls -laF'
alias reload='src'
alias zshconfig="code $PROJECTS/dotfiles/general/.zshrc"
alias ohmyzsh="code $ZSH"

# git aliases
alias gs='git status '
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

################# OH MY ZSH CONFIGURATIONS
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
