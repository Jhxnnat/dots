#!/usr/bin/bash

repopath=~/Dev/dots

set -ex

#TODO: make backup if other config found

ln -s $repopath/.tmux.conf ~/.tmux.conf
ln -s $repopath/config.fish ~/.config/fish/config.fish
ln -s $repopath/nvim ~/.config/nvim
ln -s $repopath/helix ~/.config/helix
ln -s $repopath/ghostty ~/.config/ghostty
ln -s $repopath/swaylock ~/.config/swaylock
ln -s $repopath/fuzzel ~/.config/fuzzel
ln -s $repopath/niri ~/.config/niri
ln -s $repopath/waybar ~/.config/waybar
ln -s $repopath/alacritty ~/.config/alacritty
ln -s $repopath/.gdbinit ~/.gdbini
