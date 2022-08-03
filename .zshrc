export HISTFILESIZE=5000
export HISTSIZE=5000
export HISTFILE=$HOME/.zsh_history
export HISTTIMEFORMAT="[%F %T] "

setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

autoload -U compinit && compinit

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

setopt autocd autopushd pushdignoredups

source $HOME/.fs_alias
source $HOME/.git_alias

eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

HOST=SIVA

PS1="%m %B%F{red}::%b%f %B%F{green}%3~%b%f %F{blue}%#%f %B%F{red}%(?..[%?] )%b%f"

