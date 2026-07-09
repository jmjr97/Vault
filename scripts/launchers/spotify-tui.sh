#!/usr/bin/env bash
# ======================================================================
# File: spotify-tui.sh
# Desc: launch spotify-tui with daemon and media controls
# ======================================================================

main() {
  action=$1

  if [ "${action}" == "launch" ]; then
    if pgrep -f "spotify_player -d" > /dev/null; then
			hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e spotify_player", { tag = "float_d" }))'
    else
      spotify_player -d &
			hyprctl eval 'hl.dispatch(hl.dsp.exec_cmd( "ghostty -e spotify_player", { tag = "float_d" }))'
    fi
  fi

  if [ "${action}" == "term" ]; then
    if pgrep -f "spotify_player -d" > /dev/null; then
      spotify_player
    else
      spotify_player -d &
      spotify_player
    fi
  fi
}

main $@
