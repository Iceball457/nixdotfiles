{
  description = "Nixos config flake";
  imports = [
    ./configuration.nix
  ];
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    homeConfigurations = {
    "frosti@coldsnap" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          {
            home.stateVersion = "24.05";
            home.username = "frosti";
            home.homeDirectory = "/home/frosti";
          }
          (
            { pkgs, ...}:
            {
              wayland.windowManager.hyprland.enable = true;
            }
          )
        ];
      };
    };
  };
}
