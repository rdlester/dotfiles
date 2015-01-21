PATH=$PATH:/usr/local/sbin:/usr/local/share/npm/bin:/Users/Ryan/.cabal/bin
export PATH

powerline-daemon -q
. $(brew --prefix)/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
bind "set completion-ignore-case on"

[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

alias bup="brew update; brew upgrade; cabal update; vim +VundleUpdate;"
