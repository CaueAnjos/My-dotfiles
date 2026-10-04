{
  self,
  inputs,
  ...
}: let
  inherit (inputs) nvf import-tree nix-colors;

  modules = [(import-tree ./_nvf)];
in {
  perSystem = {
    pkgs,
    config,
    ...
  }: {
    packages.neovim-kawid =
      (nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules =
          modules
          ++ [
            {
              vim.palette = nix-colors.colorSchemes.catppuccin-mocha.palette;
            }
          ];
      }).neovim;

    overlayAttrs = {
      inherit (config.packages) neovim-kawid;
    };
  };

  flake.modules.homeManager.NeovimKawid = {config, ...}: {
    imports = [
      inputs.nvf.homeManagerModules.default
      self.modules.homeManager.ThemedStylix
    ];

    stylix.targets.nvf.enable = false;

    home.sessionVariables.EDITOR = "vim";

    programs.nvf = {
      enable = true;
      settings = {
        imports = modules;
        vim.palette = config.lib.stylix.colors;
      };
    };
  };
}
