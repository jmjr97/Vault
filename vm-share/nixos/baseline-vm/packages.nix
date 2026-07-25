{ config, pkgs, ... }:

{
  # -- Programs --------------------------------------------
	programs.fish.enable = true;
  programs.firefox.enable = true;

	# -- Packages --------------------------------------------
  environment.systemPackages = with pkgs; [
	# System
	vim
	wget

	# Terminal
	ghostty
	starship
	zoxide
	eza
	fzf
	yazi

	# Applications

  ];
}
