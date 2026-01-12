{
  description = "CTF Python Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      randcrack = pkgs.python3Packages.buildPythonPackage rec {
        pname = "randcrack";
        version = "0.2.0";
        src = pkgs.python3Packages.fetchPypi {
          inherit pname version;
          sha256 = "06q20xydwld9z7ny4dmbsz66gjdzf8dd29h81x9ncxhlxb6lxkyc";
        };
        doCheck = false;
        format = "setuptools";
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          (python3.withPackages (ps: with ps; [
            requests
            pwntools
            scapy
            pycryptodome
            randcrack
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
            randcrack
      ]);
    };
}
