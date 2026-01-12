{
  description = "Web Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
          python3
        ];

        shellHook = ''
          export DEV_SHELL_NAME="web"
          echo "Web Dev Environment Loaded"
          echo "Node: $(node --version)"
          echo "Npm: $(npm --version)"
          echo "Python: $(python --version)"
        '';
      };
    };
}
