{ pkgs, ... }:

let
  # Wrap VSCode in an FHS environment so PlatformIO toolchains work
  vscode-fhs = pkgs.buildFHSEnv {
    name = "vscode-fhs";
    targetPkgs = pkgs: with pkgs; [
      # VSCode and extensions
      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          # Nix support
          jnoortheen.nix-ide
          
          # Python
          ms-python.python
          ms-python.vscode-pylance
          
          # Git
          eamodio.gitlens
          
          # Formatting & Linting
          esbenp.prettier-vscode
          dbaeumer.vscode-eslint
          
          # Embedded Development
          platformio.platformio-vscode-ide
          ms-vscode.cpptools
          
          # General productivity
          vscodevim.vim
          ms-vscode.hexeditor
        ];
      })
      
      # Dependencies for PlatformIO and embedded development
      python3
      platformio-core
      git
      
      # Common libraries needed by toolchains
      stdenv.cc.cc.lib
      zlib
      libusb1
      udev
    ];
    runScript = "code";
    profile = ''
      export PLATFORMIO_CORE_DIR="$HOME/.platformio"
    '';
  };
in
{
  home.packages = [ vscode-fhs ];
}
