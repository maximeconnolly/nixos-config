{
  description = "Reproducible environment for AIIA1016";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pythonWithPackages = pkgs.python3.withPackages (ps: with ps; [
          jupyterlab
          numpy
          pandas
          scipy
          matplotlib
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          PYTHONBIN = "${pythonWithPackages}/bin/python";
          packages = [ pythonWithPackages ];
          shellHook = "jupyter lab";
        };
      }
    );
}
