# ======================================================================
# Config: fish
# File: .config/fish/config.fish
# Platform: shared
# Link: https://github.com/fish-shell/fish-shell
# ======================================================================

if status is-interactive
	# Commands to run in interactive sessions can go here
	set -g fish_greeting
	set -g fish_key_bindings fish_vi_key_bindings
	set -Ux SUDO_EDITOR nvim
	set -gx EDITOR nvim

	fish_config theme choose catppuccin-mocha
	abbr so source ~/.config/fish/config.fish

	## navigation ##
	alias ls='eza -a -s=type --icons=auto'
	alias ll='eza -a -l -h -s=type --icons=auto'
	alias ..='cd ..'
	alias rd='z -'

	# nixos
	# alias ne='sudoedit /etc/nixos/configuration.nix'
	# abbr nrb sudo nixos-rebuild switch

	# pacman
	abbr pi sudo pacman -S --needed
	abbr pr sudo pacman -Rns
	abbr pu sudo pacman -Syu
	abbr ps pacman -Ss
	abbr pq pacman -Qs
	abbr pqe pacman -Qe
	abbr pc checkupdates
	abbr pro 'sudo pacman -Rns $(pacman -Qdtq)'

	# neovim
	alias vim='nvim'
	alias v='nvim .'
	alias se='sudoedit'
	alias oh='nvim ~/Dropbox/obsidian/home.md'
	alias orn='nvim ~/Dropbox/obsidian/notes/_random.md'

	# apps
	alias cat='bat'
	alias f='yazi'
	alias ff='fastfetch'
	alias top='btop'

	# misc
	abbr modx chmod u+x
	abbr ze zoxide edit

	# python
	abbr py python

	## functions ##

	# yazi cd on exit
	function f
		set tmp (mktemp -t "yazi-cwd.XXXXXX")
		command yazi $argv --cwd-file="$tmp"
		if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
			builtin cd -- "$cwd"
		end
		rm -f -- "$tmp"
		echo -e "\n\e[2;3;4;33m$(pwd)\e[0m"
		ls
	end

	function cd
		zo $argv
		echo -e "\n\e[2;3;4;33m$(pwd)\e[0m"
		ls
	end

	function fzf_cd
		fzf-cd-widget
		echo -e "\n\e[2;3;4;33m$(pwd)\e[0m"
		ls
	end

	function cdi
		zi $argv
		echo -e "\n\e[2;3;4;33m$(pwd)\e[0m"
		ls
	end

	function cfg
		~/Vault/scripts/launchers/configs.sh
	end

	function starship_transient_prompt_func
			echo ''
		starship module character
	end

	function rs
		cd
		clear
	end

	function fish_user_key_bindings
		bind -M insert \cf fzf_cd
		bind -M insert ctrl-space accept-autosuggestion
		bind -M insert ctrl-k cfg
	end

	zoxide init fish | source
	zoxide init --cmd zo fish | source
	fzf --fish | source
	starship init fish | source
	enable_transience
end
