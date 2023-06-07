# dotfiles
My dotfiles repository

### Linux packages

#### Pacman

For Arch-based distros

[arch-pkg](resources/arch-pkg)

```
pacman -S $(echo packages.txt)
```

#### Xbps

For Voidlinuxbased distros

[void-installed](resources/void-installed)

```
sudo xbps-install -Su
sudo xbps-install $(cat void-installed)
```

---

### My config files

Do bare clone
```
git clone --bare https://codeberg.org/st/dots.git ~/.dotfiles
```
Create **config** alias
```
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
config config status.showUntrackedFiles no
```

#### Shell

##### Zsh

https://github.com/zsh-users/zsh-autosuggestions

https://github.com/zsh-users/zsh-syntax-highlighting \
https://github.com/zdharma/fast-syntax-highlighting

### System configs

#### Environment

`/etc/environment`:
```
QT_QPA_PLATFORMTHEME=qt5ct
LANG=EN_US.UTF-8
LC_CTYPE=en_US.UTF-8
```

#### Post-setup

#### xorg

```
sudo cp -r xorg.conf.d/ /etc/X11/
```

#### acpi

```
sudo rm /etc/acpi/handler.sh
sudo ln -s $HOME/.scripts/sys/handler.sh /etc/acpi/
```
