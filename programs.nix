{ pkgs, ... }:
{	
	hardware.opentabletdriver.enable = true;
	programs.steam.enable = true;

	environment.systemPackages = with pkgs; [
		gimp
		obs-studio
		dissent # Discord
	];

	fonts.packages = with pkgs; [
		
	];
}
