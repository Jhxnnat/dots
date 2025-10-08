Computer configurations files in case of emergency, or os reinstall...

* Skarr: main laptop
* ???: VPS

## Seting up

* Dependencies

Fedora:
```
sudo dnf install neovim helix fish tmux
```

Arch:
```
sudo pacman -Syu neovim helix fish tmux
```

* get vim-plug: https://github.com/junegunn/vim-plug
* get kmonad: https://github.com/kmonad/kmonad

```
chmod +x ./kmonad
sudo cp ./kmonad /sbin/kmonad
```

```
ssh-keygen
```

* add ssh key: gitlab, github
* clone

server:
```
ssh-copy-id jhx@*****
```

symlinks:

* edit $repopath before!
* bash ./link.sh

kmonad systemd services:

* external keyboard:
    * ./kmonad/kmonad_external.service
    * ./kmonad/kmonadconf-tdagger.kbd
* laptop built-in:
    * ./kmonad/kmonad_builtin.service
    * ./kmonad/kmonad_script_builtin.sh
    * ./kmonad/kmonadconf-laptop.kbd

```
sudo cp ./kmonad/kmonadconf-tdagger.kbd /etc/kmonad/kmonadconf-tdagger.kbd
sudo cp ./kmonad/kmonadconf-laptop.kbd /etc/kmonad/kmonadconf-laptop.kbd
sudo cp ./kmonad/kmonad_builtin.service /etc/systemd/user/kmonad_builtin.service
sudo cp ./kmonad/kmonad_external.service /etc/systemd/user/kmonad_external.service
sudo cp ./kmonad/kmonad_script_external.sh /etc/kmonad/kmonad_script_external.sh
```

```
systemctl --user daemon-reload

systemctl --user enable kmonad_builtin
systemctl --user start kmonad_builtin

systemctl --user enable kmonad_external
systemctl --user start kmonad_external
```
