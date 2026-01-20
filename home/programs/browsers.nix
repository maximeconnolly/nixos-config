{
  pkgs,
  config,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      extensions = [
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden Password Manager
      ];
    };
    firefox = {
      enable = true;
      profiles.mstpierre = {};
    };
  };

  xdg.desktopEntries.chromium = {
    name = "Chromium";
    genericName = "Web Browser";
    exec = "chromium %U";
    terminal = false;
    categories = [ "Application" "Network" "WebBrowser" ];
    mimeType = [ "text/html" "text/xml" "application/xhtml+xml" "application/vnd.mozilla.xul+xml" "text/mml" "x-scheme-handler/http" "x-scheme-handler/https" ];
  };
}