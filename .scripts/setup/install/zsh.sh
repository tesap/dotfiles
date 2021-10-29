# yay -S --needed --noconfirm zsh zsh-syntax-highlighting zsh-autosuggestions 
yay -S --needed --noconfirm zsh

mv .zshrc .zshrc-backup
mv .zsh .zsh-backup

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.zsh/custom}/plugins/zsh-autosuggestions

echo '#!/usr/bin/sh

export ZSH="$HOME/.zsh"
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR

# ZSH_THEME="af-magic"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source ~/.alias_bash
source ~/.alias_zsh

' >> .zshrc

chsh -s /usr/bin/zsh
