touch ~/.todo && cat ~/.todo

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt CORRECT

############################################################
# Custom shit
############################################################
touch ~/.aliases && source ~/.aliases
touch  ~/.secrets && source ~/.secrets

export R29=~/workspace/r29

############################################################
# Third party shit
############################################################
[[ -d /usr/local/opt/autoenv ]] && source /usr/local/opt/autoenv/activate.sh

touch ~/.git-completion && source ~/.git-completion

[ -f /Users/blue/.travis/travis.sh ] && source /Users/blue/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYTHONSTARTUP=~/.pythonrc
