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

      inputs.stylix.nixosModules.stylix

      ./boot.nix
      ./configuration.nix
      ./display-manager.nix
      ./hardware-configuration.nix
      ./keyboard.nix
      ./mouse-fix.nix
      ./network.nix
      ./services.nix
      ./stylix.nix
      ./users.nix
      ./virtualisation.nix
    ];
  };
}
