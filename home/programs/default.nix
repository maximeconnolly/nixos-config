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
        ./vscode.nix
    ];
}