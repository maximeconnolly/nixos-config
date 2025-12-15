{ config, pkgs, ... }:
{
    imports = 
    [
      ../../modules/system.nix

      ./hardware-configuration.nix
    ];

  # Bootloader.
  # Use systemd-boot for UEFI systems (common for MSI laptops)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "msi-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Spotify and google cast firewall extensions (copied from reference)
  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
  
  system.stateVersion = "25.11";
}
