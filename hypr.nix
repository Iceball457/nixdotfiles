{ pkgs, ... }:
{
	services.displayManager.sddm.wayland.enable = true;
	services.displayManager.sddm.enable = true;

	programs.hyprland.enable = true;
	programs.steam.enable = true;

	hardware.opentabletdriver.enable = true;

	environment.systemPackages = with pkgs; [
		kitty
		waybar
		hyprpaper
		hyprshot
		librewolf
		nemo
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
		oculante
		nwg-drawer
		xdg-desktop-portal-gtk
		xdg-desktop-portal-wlr
		libadwaita
		clipse
		wl-clipboard
		file-roller
		font-manager
		mission-center
		brightnessctl
		hyprpicker
		playerctl
	];

	fonts.packages = with pkgs; [
		font-awesome
		fira-code
		fira-code-symbols
		noto-fonts-emoji
		nerd-fonts.jetbrains-mono
	];
}
