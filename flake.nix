{
  description = "Home Manager configuration of kawid";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
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
  };
}
