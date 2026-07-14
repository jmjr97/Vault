#!/usr/bin/env bash

killall waybar
killall hyprpaper
# killall swaync
# killall swayosd-server

waybar &
hyprpaper &
# swaync &
# swayosd-server &
