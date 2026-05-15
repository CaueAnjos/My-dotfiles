{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;
in {
  flake.nixosConfigurations.PCCaueNixos = lib.nixosSystem {
    specialArgs = {
      inherit inputs;
    };

    modules = [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.kawid = ./../home-manager/home.nix;
          extraSpecialArgs = {inherit inputs;};
          backupFileExtension = "backup";
        };
      }

      ./users.nix
      ./keyboard.nix
      ./boot.nix
      ./network.nix
      ./services.nix
      ./configuration.nix
      ./hardware-configuration.nix
      ./display-manager.nix
    ];
  };
}
