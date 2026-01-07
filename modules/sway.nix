{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      mako # notification daemon
      wofi # menu
      waybar # status bar
      # screenshots
      grim
      slurp
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
  };

  # Optional: Enable xwayland if it's not already by sway
  # programs.xwayland.enable = true; 

  environment.sessionVariables = {
    # Hints for Electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
    
    # Nvidia specific variables (safe to valid even if not nvidia, but required for nvidia)
    WLR_NO_HARDWARE_CURSORS = "1"; 
    LIBVA_DRIVER_NAME = "nvidia"; 
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
