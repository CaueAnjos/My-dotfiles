{
  inputs,
  pkgs,
  lib,
  ...
}: let
  wallpapers = inputs.gruvbox-walls.packages.${pkgs.system}.default;
in {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.file."wallpapers" = {
    source = wallpapers;
    recursive = true;
  };

  programs.noctalia-shell = {
    enable = true;
    settings = lib.mkForce (builtins.fromJSON (builtins.readFile ./noctalia.json));
  };
}
