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
}