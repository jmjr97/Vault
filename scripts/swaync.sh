#!/usr/bin/env bash

status=$(hyprctl getoption plugin:hyprbars:enabled | grep bool | awk '{print $2}')

main () {
  case $@ in
    toggle_bars)
			status=$(hyprctl getoption plugin:hyprbars:enabled | grep bool | awk '{print $2}')

			if [ "$status" == "true" ]; then
				echo 'status is true'
				hyprctl eval 'hl.config({ plugin = { hyprbars = { enabled = false }}})'
			else
				echo 'status is false'
				hyprctl eval 'hl.config({ plugin = { hyprbars = { enabled = true }}})'
			fi
      ;;
		clipboard)
			cliphist list | rofi -dmenu | cliphist decode | wl-copy
			;;
		picker)
			hyprpicker -a
			;;
  esac

	swaync-client -t
}

main $@
