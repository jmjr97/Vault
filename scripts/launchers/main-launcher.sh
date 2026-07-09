#!/bin/bash
# ======================================================================
# File: main-launcher.sh
# Desc: script to launch tui apps with custom classes
# ======================================================================

main () {
  case $@ in
    rofi)
			rofi -m -1 -show drun
      ;;
    lazygit)
			ghostty -e lazygit -p ~/Vault/
      ;;
    btop)
			ghostty -e btop
      ;;
    bluetui)
			hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e bluetui", { tag = "float_d" }))'
      ;;
    notes)
			ghostty -e nvim ~/Dropbox/obsidian/notes/quick-notes.md ~/Dropbox/obsidian/notes/my-notes.md ~/Dropbox/obsidian/notes/_dump.md
      ;;
		yazi)
			ghostty -e yazi
			;;
  esac
}

main $@
