{ pkgs, ... }:
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		
	];

	fonts.packages = with pkgs; [
		gimp
	];
}
