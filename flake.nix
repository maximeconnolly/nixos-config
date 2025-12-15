{
 description = "mconnolly NixOS Flake";
 inputs = {
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
   home-manager = {
     url = "github:nix-community/home-manager/master";
     inputs.nixpkgs.follows = "nixpkgs";
   };
   
   nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
   
 };
 outputs = {self, nixpkgs, home-manager, nix-vscode-extensions, ...} @inputs: {
   nixosConfigurations = {
       "nixos" = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           ./hosts/nixos-vm
           home-manager.nixosModules.home-manager
             {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.extraSpecialArgs = inputs;
               home-manager.users.mconnolly = import ./home;
             } 
         ];
     };
      "msi-laptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/msi-laptop
          home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs;
              home-manager.users.mconnolly = import ./home;
            } 
        ];
      }; 
   };
 };
}
