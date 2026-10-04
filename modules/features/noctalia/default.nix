{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.NoctaliaKawid = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      inputs.noctalia.homeModules.default
      self.modules.homeManager.Wallpapers
    ];

    home.packages = with pkgs; [
      ddcutil
    ];

    programs.noctalia = {
      enable = true;
      settings = lib.mkForce (builtins.fromTOML (builtins.readFile ./noctalia.toml));
    };
  };
}
