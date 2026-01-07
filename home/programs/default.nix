{
    config,
    pkgs,
    ...
}: {
    imports = [
        ./browsers.nix
        ./spotify.nix
        ./common.nix
        ./niri.nix
        ./waybar.nix
        ./gnome.nix
    ];
}