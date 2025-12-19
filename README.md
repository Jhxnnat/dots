Computer configurations files in case of emergency, or os reinstall...
files managed using [chezmoi](https://www.chezmoi.io/install/#one-line-package-install)

```bash
# Arch
sudo pacman -Syu fish helix neovim niri mako fuzzel
```

```bash
# Fedora
sudo dnf install fish helix neovim niri
```

```bash
# cargo/rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

```bash
# pyenv
curl -fsSL https://pyenv.run | bash
```

```bash
# chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Jhxnnat
chezmoi diff
chezmoi apply
```

