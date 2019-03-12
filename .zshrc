export TERM="xterm-256color"

# Customise the Powerlevel9k prompts and load Nerd Fonts with PowerLevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( os_icon context dir vcs newline)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'

# Set a color for iTerm2 tab title background using rgb values
function title_background_color {
  echo -ne "\033]6;1;bg;red;brightness;$ITERM2_TITLE_BACKGROUND_RED\a"
  echo -ne "\033]6;1;bg;green;brightness;$ITERM2_TITLE_BACKGROUND_GREEN\a"
  echo -ne "\033]6;1;bg;blue;brightness;$ITERM2_TITLE_BACKGROUND_BLUE\a"
}
ITERM2_TITLE_BACKGROUND_RED="18"
ITERM2_TITLE_BACKGROUND_GREEN="26"
ITERM2_TITLE_BACKGROUND_BLUE="33"
title_background_color

# zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

################# OH MY ZSH
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/samhwang/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

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

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

case `uname` in
  Darwin)
    # commands for OS X go here
    plugins=(
    git iterm2 vscode meteor osx brew macports z zsh-syntax-highlighting
    )
  ;;
  Linux)
    # commands for Linux go here
    plugins=(
    git vscode meteor ubuntu z zsh-syntax-highlighting
    )
  ;;
esac

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# Setting PATH for PHP 7.0
export PATH="/usr/local/php5/bin:$PATH"

# Load NVM into shell session as a function
export NVM_DIR="/Users/samhwang/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# PATH for Ruby
export PATH="/Users/samhwang/.gem/ruby/2.3.0/bin:$PATH"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# system aliases
alias ll='ls -laF'

# git aliases
alias gs='git status '
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

# ClassCom Specific aliases
alias rc_start='meteor npm start'
alias rc_test='TEST_MODE=true meteor npm start'
alias rc_chimp='meteor npm run chimp-test'

alias composer="php /usr/local/bin/composer.phar"
