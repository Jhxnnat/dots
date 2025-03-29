#!/bin/bash

# From: https://github.com/linkfrg/dotfiles/blob/main/.config/hypr/scripts/hyprlock-time.sh

current_hour=$(date +"%H")
# user_string="<span color='$primaryHex'>$USER</span>"

if [ "$current_hour" -ge 5 ] && [ "$current_hour" -lt 12 ]; then
    echo "Buen día, $USER"
elif [ "$current_hour" -ge 12 ] && [ "$current_hour" -lt 18 ]; then
    echo "Hace calor, $USER?"
elif [ "$current_hour" -ge 18 ] && [ "$current_hour" -lt 22 ]; then
    echo "Buena tardes, $USER"
else
    echo "Buena noches, $USER"
fi
