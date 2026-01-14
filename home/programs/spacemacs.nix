{ config, pkgs, ... }:

{
  home.file.".spacemacs" = {
    source = ./.spacemacs;
    force = true;
  };
}
