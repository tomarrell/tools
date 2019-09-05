# Char encoding
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Add Go binaries to path
export PATH=$HOME/go/bin:$PATH
export PATH=$PATH:/usr/local/opt/rabbitmq/sbin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add files in dir to completions
fpath=(~/.config/tomarrell/tools/zsh/completions $fpath)

# Path to your oh-my-zsh installation.
export ZSH="/Users/Tom/.oh-my-zsh"
export GOPATH="$HOME/go"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias git="hub"
alias gpr="git pull-request"

alias tomssh="ssh -i ~/.ssh/tomssh.pem ec2-user@ec2-54-144-70-62.compute-1.amazonaws.com"
alias okapi="ssh -i ~/.ssh/okapissh ec2-user@ec2-13-55-74-244.ap-southeast-2.compute.amazonaws.com"

alias c="clear"

alias ts="tig status"

alias kt="kubectl --context=theta-k8s-eu.sam-app.ro --namespace=logistics"
alias km="kubectl --context=minikube"

# Play nice inside Emacs
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

rm -f "$HOME/.zcompdump"
compinit
