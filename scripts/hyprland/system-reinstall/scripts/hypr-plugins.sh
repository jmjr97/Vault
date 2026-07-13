#!/usr/bin/env bash

echo -e "\nUpdating hyprpm"
hyprpm update

if [[ "$(hyprpm list | grep hyprbars)" == "" ]]; then
	echo -e "\nAdding plugin repo"
	hyprpm add https://github.com/hyprwm/hyprland-plugins
fi

if [[ "$(hyprpm list | awk '/hyprbars/{getline; print}' | awk '{print $3}')" != *true* ]]; then
	echo -e "\nEnabling hyprbars"
	hyprpm enable hyprbars
fi

if [[ "$(hyprpm list | grep scrolloverview)" == "" ]]; then
	echo -e "\nAdding scrolloverview repo"
	hyprpm add https://github.com/yayuuu/hyprland-scroll-overview.git
fi

if [[ "$(hyprpm list | awk '/scrolloverview/{getline; print}' | awk '{print $3}')" != *true* ]]; then
	echo -e "\nEnabling scrolloverview"
	hyprpm enable hyprbars
fi


