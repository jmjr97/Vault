#!/usr/bin/env bash

killall waybar
killall swaybg
# killall swaync
# killall swayosd-server

waybar &
# swaync &
# swayosd-server &

host=$(hostname)
echo $host
if [[ "$host" == "archbook" ]]; then
	swaybg -o eDP-1 -i /home/john/Vault/Wallpapers/1monitor/colorful.jpg &
else
	swaybg -o DP-1 -i /home/john/Vault/Wallpapers/2monitors/split/burst-l.png &
	swaybg -o HDMI-A-1 -i /home/john/Vault/Wallpapers/2monitors/split/burst-r.png &
fi

