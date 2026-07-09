#!/usr/bin/env bash

status=$(hyprctl getoption plugin:hyprbars:enabled | grep bool | awk '{print $2}')
echo $status
 
if [ "$status" == "true" ]; then
	echo 'status is true'
	hyprctl eval 'hl.config({ plugin = { hyprbars = { enabled = false }}})'
else
	echo 'status is false'
	hyprctl eval 'hl.config({ plugin = { hyprbars = { enabled = true }}})'
fi
