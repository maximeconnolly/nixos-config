{ pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      output = {
        "*" = {
          bg = "${../../media/background/wallpaper.png} fill";
        };
      };
    };
  };
}
