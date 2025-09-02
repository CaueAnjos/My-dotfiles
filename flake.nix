{
  description = "Home Manager configuration of kawid";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.system.default =
      (nvf.lib.neovimConfigurations {
        pkgs = nixpkgs.legacyPackages.system;
        modules = [./dotfiles/neovim];
      }).neovim;

    homeConfigurations."kawid" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
      ];
    };
  };
}
