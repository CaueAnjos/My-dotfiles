{
  description = "Home Manager configuration of kawid";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nvf,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in {
    packages.${system}.neovim =
      (nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [./neovim];
        extraSpecialArgs = {
          inherit pkgs-stable;
          inherit inputs;
        };
      }).neovim;

    homeConfigurations."kawid" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home-manager/home.nix
      ];
      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };
}
