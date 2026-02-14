{ config, pkgs, ... }:
{
    imports = [
      ../../modules/system.nix
      ../../modules/niri.nix

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



  # Nvidia configuration
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Enable VMware Workstation
  virtualisation.vmware.host.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Agenix identity paths
  age.identityPaths = [ "/home/mconnolly/.ssh/id_ed25519" ];

  # Agenix secrets
  age.secrets.test-secret.file = ../../secrets/test-secret.age;
  
  system.stateVersion = "25.11";
}
