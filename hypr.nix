{ pkgs, ... }:
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		kitty
		wwofi
		waybar
		hyprpaper
		xdg-desktop-portal-hyprland
		xdg-desktop-portal-gtk
		
	];
}
