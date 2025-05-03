{ pkgs, config,...}:
{
  programs.steam.enable = true;
  hardware.opentabletdriver.enable = true;
  
  home.packages = with pkgs; [
    gimp
		obs-studio
		dissent # Discord
		openrgb-with-all-plugins
  ];
  
  home.file.".config/".recursive = ./frosti;
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}