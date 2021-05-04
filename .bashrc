# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$HOME/.bin:$HOME/.emacs.d/bin:$PATH
# export TERM=xterm-256color
export TERMCMD=alacritty
export BROWSER=firefox
# export HARDWARECLOCK=UTC+3
export SVDIR=$HOME/.service

# Other
export _JAVA_AWT_WM_NONREPARENTING=1

source ~/.alias_bash
