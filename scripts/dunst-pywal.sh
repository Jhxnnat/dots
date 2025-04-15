#!/bin/sh
pidof dunst && killall dunst
dunst -config $HOME/.cache/wal/dunstrc &
