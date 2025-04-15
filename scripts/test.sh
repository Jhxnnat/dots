for a in ~/Imágenes/walls/*; do
    echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu

