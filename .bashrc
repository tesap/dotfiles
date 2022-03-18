# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export PATH=$HOME/Applications:$HOME/.bin:$HOME/.emacs.d/bin:/usr/local/bin:$PATH

export TERMCMD=alacritty
export BROWSER=firefox
export SVDIR=$HOME/.service
# export TERM=xterm-256color
# export HARDWARECLOCK=UTC+3

export _JAVA_AWT_WM_NONREPARENTING=1

source ~/.alias_bash

export QSYS_ROOTDIR="/home/void/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"
