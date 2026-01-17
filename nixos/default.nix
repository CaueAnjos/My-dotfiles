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
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.kawid = ./../home-manager/home.nix;
        home-manager.extraSpecialArgs = {inherit inputs;};
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
