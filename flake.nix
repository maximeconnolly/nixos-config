{
 description = "mconnolly NixOS Flake";
 inputs = {
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
   home-manager = {
     url = "github:nix-community/home-manager/release-25.11";
     inputs.nixpkgs.follows = "nixpkgs";
   };
   
   nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
   agenix.url = "github:ryantm/agenix";
   
 };
 outputs = {self, nixpkgs, home-manager, nix-vscode-extensions, agenix, ...} @inputs: {
   nixosConfigurations = {
       "nixos" = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         specialArgs = { inherit inputs; };
         modules = [
           ./hosts/nixos-vm
           agenix.nixosModules.default
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
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/msi-laptop
          agenix.nixosModules.default
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
