#!/usr/bin/sh

source ~/.bashrc

export HISTSIZE=1000000

DISABLE_AUTO_UPDATE="true"

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# WHat ??? TODO
# autoload -Uz compinit && compinit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT='%F{green}[%n]%f %F{blue}%~%f $ '

zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
