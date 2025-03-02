#!/usr/bin/bash

cp $HOME/.config/lvim/config.lua ./lvim/config.lua

cp $HOME/.config/VSCodium/User/settings.json ./codium/settings.json
cp $HOME/.config/VSCodium/User/keybindings.json ./codium/keybindings.json
cp -r $HOME/.config/nvim/ ./nvim
cp -r $HOME/.config/kitty/ ./kitty
cp -r $HOME/.config/alacritty/ ./alacritty
cp -r $HOME/.config/picom/ ./picom
cp -r $HOME/.config/waybar/ ./waybar
cp -r $HOME/.config/wal/ ./wal
cp -r $HOME/.config/i3/ ./i3
cp -r $HOME/.config/i3blocks/ ./i3blocks
cp -r $HOME/.config/hypr/ ./hypr

