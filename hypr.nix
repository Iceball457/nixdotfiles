{ pkgs, ... }:
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		kitty
		wofi
		waybar
		hyprpaper
		hyprshot
		librewolf
        	kdePackages.dolphin
		vscode
		hyprcursor
		nordzy-cursor-theme
	];

	# cursor.no_hardware_cursors = true;

	environment.variables = { WLR_NO_HARDWARE_CURSORS="1"; };

	# home.pointerCursor = {
	# 	gtk.enable = true;
	# 	package = pkgs.nordzy-cursor-theme;
	# };

	fonts.packages = with pkgs; [
		font-awesome
		fira-code
		fira-code-symbols
	];
}
