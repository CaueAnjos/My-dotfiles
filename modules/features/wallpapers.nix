{inputs, ...}: {
  flake.modules.homeManager.Wallpapers = {pkgs, ...}: let
    wallpapers = inputs.gruvbox-walls.packages.${pkgs.system}.default;
  in {
    home.file."wallpapers".source = wallpapers;
  };
}
