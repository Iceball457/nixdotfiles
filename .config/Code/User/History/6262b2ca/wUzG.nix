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
        nautilus
		kdePackages.dolphin
		vscode
		hyprcursor
		nwg-look
		nordzy-cursor-theme
		graphite-cursors
		pop-gtk-theme
		graphite-gtk-theme
		yaru-theme
	];

	# cursor.no_hardware_cursors = true;

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
