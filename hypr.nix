{ pkgs, ... }:
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		kitty
		wofi
		waybar
		font-awesome
		hyprpaper
	];
}
