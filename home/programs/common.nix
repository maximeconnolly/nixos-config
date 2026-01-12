{pkgs, ...}: 
let
  randomSwaylock = pkgs.writeShellScriptBin "swaylock-random" ''
    # Directory containing lockscreen images
    LOCKSCREEN_DIR="$HOME/nixos-config/media/lockscreen"
    
    # Directory containing lockscreen images
    LOCKSCREEN_DIR="$HOME/nixos-config/media/lockscreen"
    
    # Select a random image
    IMAGE=$(find "$LOCKSCREEN_DIR" -type f | shuf -n 1)
    
    # execute swaylock
    ${pkgs.swaylock}/bin/swaylock -i "$IMAGE" -s center "$@"
  '';
in
{
    home.packages = with pkgs; [
    randomSwaylock
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    helix
    emacs
    # networking tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    ipcalc  # it is a calculator for the IPv4/v6 addresses
    nmap

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    jq        # JSON processor (needed for scripts)
    obsidian

    # Embedded Development
    platformio-chrootenv  # FHS environment for PlatformIO to run dynamic executables

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

   # productivity

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # discord
    discord
    # signal
    signal-desktop

    # Desktop / Wayland tools
    wdisplays
    wofi
    alacritty
    # mako
    wl-clipboard
    xwayland-satellite
    swaylock
    swayidle
    swaybg
    blueman   # Bluetooth manager GUI
    grim      # Screenshot utility for Wayland
    slurp     # Select a region in Wayland
    swappy    # Screenshot annotation tool
    wttrbar
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    font-awesome
    swaynotificationcenter
    brightnessctl
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    ];

    fonts.fontconfig.enable = true;
    

}