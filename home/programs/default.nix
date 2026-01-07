{
    config,
    pkgs,
    ...
}: {
    imports = [
        ./browsers.nix
        ./spotify.nix
        ./common.nix
        ./sway.nix
        ./gnome.nix
    ];
}