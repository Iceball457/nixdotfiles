{ pkgs, ... }:
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		kitty
		hyprlauncher
		waybar
		hyprpaper
		xdg-desktop-portal-hyprland
		xdg-desktop-portal-gtk
		
	];
}
