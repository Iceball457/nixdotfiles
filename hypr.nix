{ pkgs, ... }:
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		kitty
		wofi
		waybar
		hyprpaper
		librewolf
                kdePackages.dolphin
	];

	fonts.packages = with pkgs; [
		font-awesome
		fira-code
		fira-code-symbols
	];
}
