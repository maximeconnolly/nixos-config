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
        ./wofi.nix
        ./gnome.nix
        ./swaync.nix
        ./vscode.nix
    ];
}