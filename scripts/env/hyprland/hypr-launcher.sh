#!/bin/bash
# ======================================================================
# File: hypr-launcher.sh
# Desc: script to launch tui apps with custom classes
# ======================================================================

main () {
  case $@ in
    rofi)
			rofi -m -1 -show drun
      ;;
    lazygit)
			hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e lazygit -p ~/Vault/", { tag = "float_d" }))'
      ;;
    btop)
			hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e btop", { tag = "float_l" }))'
      ;;
    bluetui)
			hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e bluetui", { tag = "float_d" }))'
      ;;
    notes)
			hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e nvim ~/Dropbox/obsidian/notes/quick-notes.md ~/Dropbox/obsidian/notes/my-notes.md ~/Dropbox/obsidian/notes/_dump.md", { tag = "float_d" }))'
      ;;
  esac
}

main $@
