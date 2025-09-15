{ pkgs,...}:
{
	nixpkgs.config.allowUnfree = true;
	home.packages = with pkgs; [
  	gh
		gimp
		obs-studio
		discord
		openrgb-with-all-plugins
		krita
		obsidian
		inkscape
		godot-mono
		vscode
		icu
  ];

	home.file.".config/"= {
		source = ./dotfiles;
		recursive = true;
	};

	home.stateVersion = "24.11";

	environment.sessionVariables = {
		VINTAGE_STORY = "/home/frosti/Games/vintagestory";
	};
}
