{
  self,
  inputs,
  ...
}: let
  inherit (inputs.nixpkgs) lib;
in {
  flake.nixosConfigurations.PCCaueNixos = lib.nixosSystem {
    modules = with self.modules.nixos; [
      PCCaueNixosConfiguration
      PCCaueNixosHardware
      ThemedStylix
      NixpkgsConfiguration
      Essentials
    ];
  };
}
