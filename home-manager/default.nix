{inputs, ...}: {
  flake.homeConfigurations."kawid" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      inputs.xremap-flake.homeManagerModules.default
      ./home.nix
    ];
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
