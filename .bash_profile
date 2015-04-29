# Source computer-specific profile first to set up PATH and such.
source ~/.comp_bash_profile

powerline-daemon -q
. $(brew --prefix)/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
bind "set completion-ignore-case on"

[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

export EDITOR="vim"
export GIT_EDITOR="vim"

alias reload="source ~/.bash_profile"

alias bup="brew update; brew upgrade --all; vim +VundleUpdate;"

alias ls="ls -G"
alias la="ls -AF"
alias ll="ls -l"

alias c="clear"
alias clr="clear"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -='cd -'

alias h="history"
alias hag="history | ag"

alias ffind="find . -iname"

alias md="mkdir -p"
alias mkdir="mkdir -p"
alias rd="rmdir"

alias _="sudo"

alias py="python3 -m"
