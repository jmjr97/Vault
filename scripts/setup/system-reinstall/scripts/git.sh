#!/usr/bin/env bash
# ======================================================================
# Description: git install script
# File: scripts/git.sh
# ======================================================================

echo -e "\nGit setup:"

if [ ! -d ~/.ssh ]; then
	cp ../../laptop/.ssh/ ~/.ssh/
fi

if [ ! -f ~/.gitconfig ]; then
	git config --global user.name 'John Majka Jr'
	git config --global user.email 'jmjr97@gmail.com'
fi

if [ -d ~/.ssh ]; then
	if [ ! -d ~/Code/ ]; then
		mkdir ~/Code/
	fi

	if [ ! -d ~/Vault/ ]; then
		echo "clone vault"
		git clone git@github.com:jmjr97/Vault.git ~/Vault/
	fi

	if [ ! -d ~/Code/my-code/ ]; then
		echo "clone my-code"
		git clone git@github.com:jmjr97/my-code.git ~/Code/my-code/
	fi

	if [ ! -d ~/Code/homepage/ ]; then
		echo "clone homepage"
		git clone git@github.com:jmjr97/jmjr97.github.io.git ~/Code/homepage/
	fi
fi
