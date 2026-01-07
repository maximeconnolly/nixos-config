{ pkgs, lib, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${../../media/background/wallpaper.png}";
      picture-uri-dark = "file://${../../media/background/wallpaper.png}";
    };
  };
}
