{ pkgs, cursor, home, ... }:
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

	cursor.no_hardware_cursors = true;

	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.nordzy-cursor-theme;
	};

	fonts.packages = with pkgs; [
		font-awesome
		fira-code
		fira-code-symbols
	];
}
