{ pkgs, ... }:
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		gimp
		opentabletdriver
	];

	fonts.packages = with pkgs; [
		
	];
}
