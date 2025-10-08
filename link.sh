#!/usr/bin/bash

repopath=~/Dev/dots

set -ex
ln -s $repopath/.tmux.conf ~/.tmux.conf
ln -s $repopath/config.fish ~/.config/fish/config.fish
ln -s $repopath/nvim ~/.config/nvim
ln -s $repopath/helix ~/.config/helix
ln -s $repopath/niri ~/.config/niri
ln -s $repopath/waybar ~/.config/waybar
ln -s $repopath/alacritty ~/.config/alacritty

