#!/bin/bash

device="usb-SINO_WEALTH_Gaming_KB-event-kbd"
if [[ -e "/dev/input/by-id/${device}" ]]; then
	/sbin/kmonad /etc/kmonad/kmonadconf-tdagger.kbd
if
