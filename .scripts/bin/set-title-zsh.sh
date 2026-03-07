#!/bin/bash

# export PS1=$PS1"\[\e]0;New_Terminal_Name\a\]"
export DISABLE_AUTO_TITLE="true"
printf "\e]0;$1\a"


