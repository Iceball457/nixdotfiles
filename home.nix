{ pkgs, config,...}:
{
  home.packages = with pkgs; [
    gimp
		obs-studio
		dissent # Discord
		openrgb-with-all-plugins
  ];

  home.file.".config/"= {
    source = ./frosti;
    recursive = true;
  };

  home.stateVersion = "24.11";
}