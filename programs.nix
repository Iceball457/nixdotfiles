{ pkgs, ... }:
let
	xp_pen_pentablet = pkgs.callPackage ./xp_pen_pentablet.nix {};
in
{
	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		gimp
	];

	fonts.packages = with pkgs; [
		
	];
}
