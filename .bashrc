# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$HOME/.bin:$PATH
export EDITOR=nvim
export TERM=xterm-256color
export TERMCMD=alacritty
# export HARDWARECLOCK=UTC+3
export SVDIR=$HOME/.service

COMMAND=$(history -a; tail -n 1 $HOME/.bash_history)
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
# PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'echo $PROMPT_COMMAND >> commands.txt'
# PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'echo ${PROMPT_COMMAND:+$PROMPT_COMMAND; } >> commands.txt'

source ~/.alias_bash
