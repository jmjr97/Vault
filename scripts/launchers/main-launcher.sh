#!/bin/bash
# ======================================================================
# File: main-launcher.sh
# Desc: script to launch tui apps with custom classes
# ======================================================================

desktop=$(echo $XDG_CURRENT_DESKTOP)

main () {
  case $@ in
    rofi)
			rofi -m -1 -show drun
      ;;
    lazygit)
			if [ $desktop == "Hyprland" ]; then
				hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e lazygit -p ~/Vault/", { tag = "float_d" }))'
			else
				ghostty -e lazygit -p ~/Vault/
			fi
      ;;
    btop)
			if [ $desktop == "Hyprland" ]; then
				hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e btop", { tag = "float_l" }))'
			else
				ghostty -e btop
			fi
      ;;
    bluetui)
			hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e bluetui", { tag = "float_d" }))'
      ;;
    notes)
			if [ $desktop == "Hyprland" ]; then
				hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e nvim ~/Dropbox/obsidian/notes/quick-notes.md ~/Dropbox/obsidian/notes/my-notes.md ~/Dropbox/obsidian/notes/_dump.md", { tag = "float_d" }))'
			else
				ghostty -e nvim ~/Dropbox/obsidian/notes/quick-notes.md ~/Dropbox/obsidian/notes/my-notes.md ~/Dropbox/obsidian/notes/_dump.md
			fi
      ;;
		yazi)
			ghostty -e yazi
			;;
  esac
}

main $@
