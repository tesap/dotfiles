#!/usr/bin/sh

source ~/.bashrc

export HISTSIZE=100000
export SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Selection menu in completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Ctrl+A
bindkey -e
# Prompt
PROMPT='%F{green}[%n]%f %F{blue}%~%f $ '

# Beginning search in history
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
# Jump by words with ctrl+arrows
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
# ===

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
