
Copy whole root preserving rules and avoiding tmp dirs
```
sudo rsync -aAXHv --info=PROGRESS2 \
  --exclude='/proc/*' \
  --exclude='/sys/*' \
  --exclude='/dev/*' \
  --exclude='/run/*' \
  --exclude='/tmp/*' \
  --exclude='/mnt/*' \
  --exclude='/media/*' \
  --exclude='/lost+found' \
  / /mnt
```


# Voidlinux installation

On liveusb:
- install `iwd`, remove `dhcpcd`, `wpa_supplicant`
On booted system
- enable `dbus`, enable `iwd`.
- iwd conifg (`/etc/iwd/main.conf`):
  ```
  [General]
  EnableNetworkConfiguration=true
  
  [Network]
  NameResolvingService=resolvconf
  ```
- Setup dotfiles
  ```
  git clone github.com/tesap/dotfiles
  git --git-dir=./dotfiles --work-tree=$HOME checkout x230
  ```
- Copy `secret-dotfiles` to home; `ln -s /media/Whatever/secrets-dir $HOME/.secrets`
- TODO:
    - acpi
    - install base packages
    - 
