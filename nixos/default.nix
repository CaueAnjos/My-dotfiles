{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;
in {
  flake.nixosConfigurations.PCCaueNixos = lib.nixosSystem {
    modules = [
      ./users.nix
      ./configuration.nix
      ./hardware-configuration.nix
    ];
  };
}
