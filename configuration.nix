# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, options, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
			./hypr.nix
			inputs.home-manager.nixosModules.default
		];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "coldsnap"; # Define your hostname.
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Enable pipewire
	services.pulseaudio.enable = false;
	services.pipewire = {
    	enable = true;
    	pulse.enable  = true;
    	alsa.enable = true;
    	alsa.support32Bit = true;
		jack.enable = true;
	};
  security.rtkit.enable = true;

	# Enable flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
	# Set your time zone.
	time.timeZone = "America/Los_Angeles";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.frosti = {
		isNormalUser = true;
		description = "Frosti";
		extraGroups = [ "networkmanager" "wheel" "input" ];
	};


	home-manager = {
		backupFileExtension = "hmb";
		extraSpecialArgs = { inherit inputs; };
		users = {
			"frosti" = import ./home.nix;
		};
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# Allow dynamically linked generic linux applications
	programs.appimage = {
		enable = true;
		binfmt = true;
	};
	programs.nix-ld = {
		enable = true;
		libraries = options.programs.nix-ld.libraries.default ++ (with pkgs; [
			# Add libraries here
			fuse2
			stdenv.cc.cc
        	openssl
        	xorg.libXcomposite
        	xorg.libXtst
        	xorg.libXrandr
        	xorg.libXext
        	xorg.libX11
        	xorg.libXfixes
        	libGL
        	libva
        	pipewire
        	xorg.libxcb
        	xorg.libXdamage
        	xorg.libxshmfence
        	xorg.libXxf86vm
        	libelf
	
        	# Required
        	glib
        	gtk2
        	bzip2
	
        	# Without these it silently fails
        	xorg.libXinerama
        	xorg.libXcursor
        	xorg.libXrender
        	xorg.libXScrnSaver
        	xorg.libXi
        	xorg.libSM
        	xorg.libICE
        	gnome2.GConf
        	nspr
        	nss
        	cups
        	libcap
        	SDL2
        	libusb1
        	dbus-glib
        	ffmpeg
        	# Only libraries are needed from those two
        	libudev0-shim
	
        	# Verified games requirements
        	xorg.libXt
        	xorg.libXmu
        	libogg
        	libvorbis
        	SDL
        	SDL2_image
        	glew110
        	libidn
        	tbb
	
        	# Other things from runtime
        	flac
        	freeglut
        	libjpeg
        	libpng
        	libpng12
        	libsamplerate
        	libmikmod
        	libtheora
        	libtiff
        	pixman
        	speex
        	SDL_image
        	SDL_ttf
        	SDL_mixer
        	SDL2_ttf
        	SDL2_mixer
        	libappindicator-gtk2
        	libdbusmenu-gtk2
        	libindicator-gtk2
        	libcaca
        	libcanberra
        	libgcrypt
        	libvpx
        	librsvg
        	xorg.libXft
        	libvdpau
        	pango
        	cairo
        	atk
        	gdk-pixbuf
        	fontconfig
        	freetype
        	dbus
        	alsa-lib
        	expat
        	# Needed for electron
        	libdrm
        	mesa
        	libxkbcommon
		]);
	};

	# List packages installed in system profile. To search, run:
	environment.systemPackages = with pkgs; [
		git
		wget
		killall
		pavucontrol
		swaynotificationcenter
		libnotify
		playerctl
		power-profiles-daemon
		python3
		rustc
		cargo
		rustfmt
		udiskie
		inotify-tools
		handlr
		usbutils
		wev
		nixd
		dotnet-sdk_7
		dotnet-sdk_8
		dotnet-sdk_9
		dconf
		appimage-run
	];

	environment.sessionVariables = {
		DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
	};

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;
	services.gvfs.enable = true;
	services.hardware.openrgb.enable = true;
	
	# Additional programs
	programs.direnv.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.11"; # Did you read the comment?
}
