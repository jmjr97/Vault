#!/usr/bin/env bash

monitor=$(niri msg focused-output | grep Output | awk '{print $NF}')

if [ $monitor == "(DP-1)" ]; then
	niri msg action move-window-to-monitor-right
else
	niri msg action move-window-to-monitor-left
fi
