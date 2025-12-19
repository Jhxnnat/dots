Computer configurations files in case of emergency, or os reinstall...
<br/>
files managed using [chezmoi](https://www.chezmoi.io/install/#one-line-package-install)

* get kmonad: https://github.com/kmonad/kmonad
* get vim-plug: https://github.com/junegunn/vim-plug

### SSH keys
```bash
ssh-keygen
cat .ssh/id_ecdsa.pub | wl-copy
```
* add ssh key: gitlab, github, codeberg

### kmonad

```bash
chmod +x ./kmonad
sudo cp ./kmonad /usr/local/bin/kmonad
```

### kmonad systemd service:

```bash
sudo mkdir -p /etc/kmonad
sudo cp ./kmonad/kmonadconf-tdagger.kbd /etc/kmonad/kmonadconf-tdagger.kbd
sudo cp ./kmonad/kmonad_external.service /etc/systemd/user/kmonad_external.service
sudo cp ./kmonad/kmonad_script_external.sh /etc/kmonad/kmonad_script_external.sh
systemctl enable kmonad_external
systemctl start kmonad_external
# systemctl daemon-reload
```
