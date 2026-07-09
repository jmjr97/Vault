#!/usr/bin/env bash

main () {
	action=$@
	case $@ in
		dolphin)
			niri msg action focus-monitor -- HDMI-A-1
			niri msg action spawn -- dolphin
			;;
		firefox)
			niri msg action focus-monitor -- HDMI-A-1
			niri msg action spawn -- firefox
			;;
		obsidian)
			niri msg action focus-monitor -- HDMI-A-1
			niri msg action spawn -- obsidian
			;;
	esac
}

main $@
