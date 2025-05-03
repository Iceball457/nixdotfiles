{ pkgs, ... }:
{	
	hardware.opentabletdriver.enable = true;

	environment.systemPackages = with pkgs; [
		gimp
		libsForQt5.xp-pen-g430-driver
	];

	fonts.packages = with pkgs; [
		
	];
}
