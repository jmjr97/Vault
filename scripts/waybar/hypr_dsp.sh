#!/usr/bin/env bash

case "$@" in
	workspace_next)
		hyprctl eval 'hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))'
		;;
	workspace_prev)
		hyprctl eval 'hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))'
		;;
	files_left)
		hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "dolphin", { monitor = "DP-1" }))'
		;;
	files_right)
		hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "dolphin", { monitor = "HDMI-A-1" }))'
		;;
	web_left)
		hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "firefox", { monitor = "DP-1" }))'
		;;
	web_right)
		hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "firefox", { monitor = "HDMI-A-1" }))'
		;;
	obsidian_left)
		hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "obsidian", { monitor = "DP-1" }))'
		;;
	obsidian_right)
		hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "obsidian", { monitor = "HDMI-A-1" }))'
		;;
	left)
		hyprctl eval 'hl.dispatch(hl.dsp.layout("focus l"))'
		;;
	right)
		hyprctl eval 'hl.dispatch(hl.dsp.layout("focus r"))'
		;;
esac
