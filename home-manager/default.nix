{inputs, ...}: let
  inherit (inputs) home-manager;
in {
  imports = [
    home-manager.flakeModules.home-manager
  ];

  flake.homeConfigurations."kawid" = home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ./home.nix
    ];
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
