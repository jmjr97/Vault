#!/usr/bin/env bash

val=$(hyprctl getoption general:layout | grep str | awk '{print $2}')

if [[ $val == 'master' ]]; then
	echo 'M'
else
	echo ' '
fi
