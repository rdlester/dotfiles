# ensure PATH is set
source ~/.comp_bash_profile

# autoload compinit before zplug to ensure completion plugins work
# autoload -U compinit && compinit

# zplug
# [[ -d ~/.zplug ]] || {
#   curl -sL zplug.sh/installer | zsh
# }
source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/autojump", from:oh-my-zsh
# zplug "plugins/thefuck", from:oh-my-zsh
# zplug "plugins/git", from:oh-my-zsh
# zplug "plugins/gitfast", from:oh-my-zsh
# zplug "plugins/npm", from:oh-my-zsh
# zplug "plugins/pip", from:oh-my-zsh
# zplug "plugins/python", from:oh-my-zsh

zplug "Tarrasch/zsh-autoenv"

# zplug "hlohm/mfunc"
zplug "hlissner/zsh-autopair"

# zplug "marzocchi/zsh-notify"

setopt PROMPT_SUBST
zplug "themes/agnoster", from:oh-my-zsh, as:theme

zplug "plugins/vi-mode", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

zplug load

bindkey "^f" vi-cmd-mode

unsetopt cdablevars
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive matching

setopt AUTOCD
setopt autopushd pushdignoredups PUSHD_SILENT PUSHD_TO_HOME
setopt AUTO_NAME_DIRS

setopt CORRECT

setopt extendedglob
setopt GLOBDOTS
setopt NO_CASE_GLOB

HISTFILE="${HOME}/.zshhistory"
SAVEHIST=5000
HISTSIZE=5000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

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

# autoload -U run-help
# HELPDIR=$(brew --prefix)/share/zsh/help

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="ag -g \"\""

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
