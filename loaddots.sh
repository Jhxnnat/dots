#!/usr/bin/bash

mkdir -p ./codium
cp -r -v $HOME/.config/VSCodium/User/settings.json ./codium/settings.json
cp -r -v $HOME/.config/VSCodium/User/keybindings.json ./codium/keybindings.json

cp -r -v $HOME/.config/lvim/ .
cp -r -v $HOME/.config/nvim/ .
cp -r -v $HOME/.config/kitty/ .
cp -r -v $HOME/.config/alacritty/ .
cp -r -v $HOME/.config/picom/ .
cp -r -v $HOME/.config/waybar/ .
cp -r -v $HOME/.config/wal/ .
cp -r -v $HOME/.config/i3/ .
cp -r -v $HOME/.config/i3blocks/ .
cp -r -v $HOME/.config/hypr/ .

cp -r -v $HOME/Dev/scripts/ .

cp -r -v $HOME/Dev/bin/kmonadconf-tdagger.kbd kmonadconf-tdagger.kbd

