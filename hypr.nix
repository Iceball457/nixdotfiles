{ pkgs, config, ... }:
{
	services.greetd = {
		enable = true;
		settings = rec {
		initial_session = {
			command = "Hyprland";
			user = "frosti";
		};
		default_session = initial_session;
	};
};

	programs.hyprland.enable = true;

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
		where-is-my-sddm-theme
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
