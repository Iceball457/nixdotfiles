{ pkgs, inputs, ... }:
let 
	test_xp_driver = pkgs.libsForQt5.callPackage /home/frosti/repos/xp_pen_22r_pro_driver/default.nix { };
in {
	services.displayManager.sddm.wayland.enable = true;
	services.displayManager.sddm.enable = true;

	programs.hyprland = {
		enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
	};
	imports = [
    	inputs.hyprland.nixosModules.default
	];

	programs.steam.enable = true;

# 	services.udev.extraRules = ''
# # XP-Pen Artist 22r
# KERNEL=="hidraw*", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="091b", TAG+="uaccess", TAG+="udev-acl"
# SUBSYSTEM=="usb", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="091b", TAG+="uaccess", TAG+="udev-acl"
# SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="091b", ENV{LIBINPUT_IGNORE_DEVICE}="1"
# '';

	environment.systemPackages = with pkgs; [
		kitty
		waybar
		hyprpaper
		hyprshot
		librewolf
		nemo-with-extensions
		nemo-fileroller
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
		hyprpolkitagent
		nwg-dock-hyprland
		papers
		oculante
		nwg-drawer
		xdg-desktop-portal-gtk
		libadwaita
		clipse
		wl-clipboard
		file-roller
		font-manager
		mission-center
		brightnessctl
		hyprpicker
		playerctl
		libsForQt5.full
		kdePackages.full
		test_xp_driver
		gparted
	];

	fonts.packages = with pkgs; [
		font-awesome
		fira-code
		fira-code-symbols
		noto-fonts-emoji
		nerd-fonts.jetbrains-mono
	];
}
