{
  description = "CTF Python Environment";

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
        buildInputs = with pkgs; [
          (python3.withPackages (ps: with ps; [
            requests
            pwntools
            scapy
            pycryptodome
          ]))
        ];
        
        shellHook = ''
          echo "CTF Environment Loaded"
          echo "Python: $(python --version)"
        '';
      };

      packages.${system}.default = pkgs.python3.withPackages (ps: with ps; [
            requests
            pwntools
            scapy
            pycryptodome
      ]);
    };
}
