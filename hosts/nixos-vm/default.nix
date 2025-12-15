{ config, pkgs, ... }:
{
    imports = 
    [
      ../../modules/system.nix

      ./hardware-configuration.nix
    ];

  # Agenix secrets
  age.secrets.test-secret.file = ../../secrets/test-secret.age;

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # Enable vmware tools
  virtualisation.vmware.guest.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Agenix identity paths
  age.identityPaths = [ "/home/mconnolly/.ssh/id_ed25519" ];
  services.xserver.videoDrivers = [ "vmware" ];
  environment.systemPackages = [ pkgs.open-vm-tools ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Spotify and google cast firewall
  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
  
  system.stateVersion = "25.11";
}