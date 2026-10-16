{inputs, ...}: {
  flake.modules.homeManager.Wallpapers = {pkgs, ...}: let
    wallpapers = inputs.gruvbox-walls.packages.${pkgs.stdenv.hostPlatform.system}.default;
  in {
    home.file."wallpapers".source = wallpapers;
  };
}
