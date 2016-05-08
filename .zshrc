# ensure PATH is set
source ~/.comp_bash_profile

# zplug
[[ -d ~/.zplug ]] || {
  curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
  source ~/.zplug/zplug && zplug update --self
}
source ~/.zplug/zplug

zplug "b4b4r07/zplug"

zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh

zplug "Tarrasch/zsh-autoenv"

zplug "hlohm/mfunc"
zplug "hlissner/zsh-autopair"

bindkey "^f" zce
zplug "hchbaw/zce.zsh"

zplug "marzocchi/zsh-notify"

zplug "themes/agnoster", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

autoload -U compinit && compinit

export EDITOR="nvim"
export GIT_EDITOR="nvim"

alias nv="nvim"

alias zshrc="nvim ~/.zshrc"
alias reload="source ~/.zshrc"

alias bup="brew update; brew upgrade --all; nvim +PlugUpgrade +PlugUpdate"

alias la="ls -AF"
alias ll="ls -l"

alias c="clear"

alias h="history"
alias hag="history | ag"

alias ffind="find . -iname"

alias md="mkdir -p"
alias mkdir="mkdir -p"
alias rd="rmdir"

# pipe aliases
alias H="| head"
alias T="| tail"
alias G="| ag"
alias L="| less"
alias LL="2>&1 | less"
alias NE="2>/dev/null"
alias NUL=">/dev/null 2>&1"

autoload run-help
HELPDIR=$(brew --prefix)/share/zsh/help

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
