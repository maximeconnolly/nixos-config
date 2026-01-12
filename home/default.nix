{ config, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  # TODO please change the username & home direcotry to your own
  home.username = "mconnolly";
  home.homeDirectory = "/home/mconnolly";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
 
  # Configure networkmanager_dmenu to use alacritty and wofi
  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = wofi -d --height=600 --lines=20
    
    [terminal]
    terminal = alacritty
  '';


  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Maxime Connolly";
    userEmail = "maxime@maximeconnolly.ca";
  };

 programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your cusotm bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      
      if [ -n "$DEV_SHELL_NAME" ]; then
        # Attempt to inline the shell name after the path (\w) or inside the brackets
        # Replace the literal ']\$' with ' ($DEV_SHELL_NAME)]\$'
        # We use a temporary variable to perform the substitution to handle escaping cleanly
        
        # Check if PS1 contains ']\$' (escaping for regex/glob might be tricky in bash)
        if [[ "$PS1" == *"]\\$"* ]]; then
           export PS1="''${PS1/]\\$/ ($DEV_SHELL_NAME)]\\$}"
        else
           # Fallback: just append it after the path \w if present
           if [[ "$PS1" == *"\\w"* ]]; then
               export PS1="''${PS1/\\\\w/\\\\w ($DEV_SHELL_NAME)}"
           else
               # Final fallback: prepend
               export PS1="($DEV_SHELL_NAME) $PS1"
           fi
        fi
      fi
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      ctf-shell = "nix develop ~/nixos-config/ctf -c $SHELL";
      ros-shell = "nix develop ~/nixos-config/ros -c $SHELL";
      web-shell = "nix develop ~/nixos-config/dev/web -c $SHELL";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
