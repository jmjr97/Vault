#!/usr/bin/env bash
# ======================================================================
# Description: pacman package install script
# File: scripts/packages-utility.sh
# ======================================================================

utility=(
	git
	reflector
	fish
	starship
	zoxide
	fzf
	ripgrep
	eza
	fd
	bc
	npm
	go
	pacman-contrib
	libappindicator
	base-devel
	zip
	unzip
	man
	inetutils
	cmake
	gum
)

sudo pacman -S --needed --noconfirm ${utility[*]}
