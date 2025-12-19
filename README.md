Computer configurations files in case of emergency, or os reinstall...

* **Skarr**: main laptop

## Seting up

Arch:
`sudo pacman -Syu neovim helix fish tmux zed niri kmonad wl-copy`

Fedora:
`sudo dnf install neovim helix fish tmux zed niri`

* get kmonad: https://github.com/kmonad/kmonad
* get vim-plug: https://github.com/junegunn/vim-plug

```bash
chmod +x ./kmonad
sudo cp ./kmonad /usr/local/bin/kmonad
```

### SSH keys
```bash
ssh-keygen
cat .ssh/id_ecdsa.pub | wl-copy
```
* add ssh key: gitlab, github, codeberg

### symlinks:
`bash setup.sh`

### kmonad systemd services:
```bash
sudo mkdir -p /etc/kmonad
sudo cp ./kmonad/kmonadconf-tdagger.kbd /etc/kmonad/kmonadconf-tdagger.kbd
sudo cp ./kmonad/kmonad_external.service /etc/systemd/user/kmonad_external.service
sudo cp ./kmonad/kmonad_script_external.sh /etc/kmonad/kmonad_script_external.sh
systemctl enable kmonad_external
systemctl start kmonad_external
# systemctl daemon-reload
```
