{ pkgs, config, ... }:
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
		nautilus
		nautilus-python
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
		clipse
		wl-clipboard
		kdePackages.plasma-pa
	];

  # Let nautilus find extensions
  environment.sessionVariables.NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
	environment.pathsToLink = [
      "/share/nautilus-python/extensions"
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
