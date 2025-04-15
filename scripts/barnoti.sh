#!/usr/bin/bash

notification_timeout=1000

mute_mic () {
	wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
	notify-send 'Mic toggle'
}

get_vol () {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

get_mute () {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

set_vol () { # -1: lower / 0: mute toggle / 1: raise
	case $1 in
		1) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+;;
		-1) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-;;
		0) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	esac
}

notify_vol () {
	set_vol $1
	volume=$(get_vol)
	mute=$(get_mute)
	if [ "$mute" == "yes" ]; then
		message="󰝟 muted | $volume%"
	else
		message="󰕾 $volume%"
	fi
	# notify-send -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$message"
	notify-send -t $notification_timeout -h int:value:$volume "$message" -u low
}

get_bright () {
	VALUE=$(brightnessctl g)
	echo "$(( $VALUE * 100 / 255 ))"
}

set_brigth () { # -1 down, 1 up
	case $1 in
		-1) brightnessctl -q  s 10%-;;
		1) brightnessctl -q  s 10%+;;
	esac
}

notify_bright () {
	set_brigth $1
	brightness=$(get_bright | bc )
	notify-send -t $notification_timeout -h string:x-dunst-stack-tag:brightness_notif -h int:value:$brightness "$brightness%"
}

if [ $# -eq 0 ]; then
	notify-send -t $notification_timeout "some bad using for $HOME/Dev/scripts/barnoti.sh"
else
	case "$1" in 
		v) notify_vol $2;;
		b) notify_bright $2;;
		m) mute_mic;;
	esac
fi

