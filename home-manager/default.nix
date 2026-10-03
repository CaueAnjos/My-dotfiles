{inputs, ...}: let
  inherit (inputs) home-manager;
in {
  imports = [
    home-manager.flakeModules.home-manager
  ];

  # TODO: move to modules/users
  flake.modules.homeManager.kawid = ./home.nix;

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
