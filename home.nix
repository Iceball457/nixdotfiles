{ pkgs,...}:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    gimp
		obs-studio
		discord
		openrgb-with-all-plugins
  ];

  home.file.".config/"= {
    source = ./frosti;
    recursive = true;
  };

  home.stateVersion = "24.11";
}