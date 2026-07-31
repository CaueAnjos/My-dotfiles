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

  home.packages = with pkgs; [
    ddcutil
  ];

  home.file."wallpapers".source = wallpapers;

  programs.noctalia = {
    enable = true;
    settings = lib.mkForce (builtins.fromTOML (builtins.readFile ./noctalia.toml));
  };
}
