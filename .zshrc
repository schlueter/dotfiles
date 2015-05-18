#!/usr/local/bin/zsh

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="blusch"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    autojump
    cpv
    bower
    brew
    django
    gem
    git
    gitignore
    history
    hub
    lol
    osx
    python
    rbenv
    rsync
    ruby
    sublime
    svn
    terminalapp
    vagrant
    virtualenv
    zsh_reload
)

source $ZSH/oh-my-zsh.sh

# User configuration

PATH=$HOME/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/opt/chefdk/bin:$PATH
export PATH

CLASSPATH=$HOME/workspace/libs
export CLASSPATH

# Python
export PYTHONSTARTUP=~/.pythonrc

# pyenv
export PYENV_ROOT=/usr/local/opt/pyenv

#rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# git
source ~/.git-completion

# Aliases

# Vagrant
alias vb='vagrant box'
alias vd='vagrant destroy'
alias vd!='vagrant destroy -f'
alias vgs='vagrant global-status'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vr='vagrant reload'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias vup='vagrant up --provision'

# Git aliases
function gitCheckoutAndPull () { gco $1 && gl }
function gitDeleteBranchLocalAndOrigin () { gb -d $1 && gp origin :$1 }
alias gcb='git checkout -b'
alias gch='gco HEAD'
alias gcml='git checkout master && git pull'
alias gcdl='git checkout develop && git pull'
alias gcol=gitCheckoutAndPull
alias gdl=gitDeleteBranchLocalAndOrigin
alias gf='git fetch'
alias ghi="git log  \
--graph \
--decorate=short \
--pretty=format:'%Cblue%ad%Creset %C(yellow)%h%Creset%C(red)%d%Creset | %s [%C(green)%an%Creset]' \
--date=short"
alias gma='git merge --abort'
alias gmm='git pull origin master'
alias grp='git read-tree --prefix'
alias gs='git stash'
alias gsp='git stash pop'
alias gpr='git pull-request'
alias gw='git browse'

# alias git=hub # Don't do this, use the function instead
function git(){hub $@}

# Node aliases
alias b='broccoli'
alias nsd='npm install --save-dev'

# Random aliases
alias .z='TASKS=1 source ~/.zshrc'
alias fuck='sudo $(fc -ln -1)' # Rerun last command with sudo
alias c='clear'
alias cpwd='pwd | pbcopy'
alias ish='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' # insecure shell
alias allow='sudo xattr -d -r com.apple.quarantine' # Make osx stop pestering you about running a new program
alias tt=travistest

# Setup env tools
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# Secret stuff goes in here so you can't see it
source ~/.secrets

# added by travis gem
[ -f /Users/blue/.travis/travis.sh ] && source /Users/blue/.travis/travis.sh

HOUR=$(date +%H)
DAY_OF_WEEK=$(date +%u)
# Display current tickets during working hours
if [[ -z $TASKS && $HOUR > 7 && $HOUR < 20 && $DAY_OF_WEEK < 6 ]]; then
    jira ls
fi
