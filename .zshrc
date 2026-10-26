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
PROMPT='%F{green}[%n]%f %(?..%F{red}[%?] %f)%F{blue}%~%f $ '
# Ctrl+arrow
# autoload -U select-word-style
# select-word-style bash
# Minus / . - _
WORDCHARS='*?[]~=&;!#$%^(){}<>'


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

# Setup title
DISABLE_AUTO_TITLE="true"
autoload -Uz add-zsh-hook
lastcmd=""
function set_title() {
    source ~/.scripts/set-title-zsh.sh "[zsh] ($(basename $(pwd))) $lastcmd"
}
function preexec() {
    lastcmd=$1
    set_title
}
function precmd() {
    set_title
}
add-zsh-hook -Uz preexec preexec
add-zsh-hook -Uz precmd precmd
# ===

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

