{ pkgs, ... }:
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		kitty
		waybar
		hyprpaper
		hyprshot
		librewolf
		nautilus
		vscode
		hyprcursor
		nwg-look
		nordzy-cursor-theme
		graphite-cursors
		pop-gtk-theme
		graphite-gtk-theme
		yaru-theme
		hyprlock
		networkmanagerapplet
		hyprutils
		hyprls
		hyprshade
		blueberry
		nwg-dock-hyprland
		papers
		swayimg
		nwg-drawer
		xdg-desktop-portal-gtk
		xdg-desktop-portal-wlr
		clipse
	];

	programs.nautilus-open-any-terminal = {
		enable = true;
		terminal = "kitty";
	};

	fonts.packages = with pkgs; [
		font-awesome
		fira-code
		fira-code-symbols
	];
}
