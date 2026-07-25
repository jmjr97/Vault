{ config, pkgs, ... }:

{
	home.username = "john";
	home.homeDirectory = "/home/john";
	home.stateVersion = "26.05";
	home.packages = [ ];
}
