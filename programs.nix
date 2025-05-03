{ pkgs, ... }:
{	
	hardware.opentabletdriver.enable = true;

	environment.systemPackages = with pkgs; [
		gimp
	];

	fonts.packages = with pkgs; [
		
	];
}
