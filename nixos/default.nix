{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;
in {
  flake.nixosConfigurations.PCCaueNixos = lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./configuration.nix
      ./hardware-configuration.nix
    ];
  };
}
