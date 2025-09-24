{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/autocomplete.nix
    ./modules/plugins
    ./modules/lsp.nix
    ./modules/diagnostics.nix
    ./modules/keymaps.nix
  ];

  vim = let
    theme = {
      name = "catppuccin";
      style = "mocha";
    };
  in {
    package = pkgs.neovim-unwrapped;

    options = import ./options.nix;
    globals = import ./globals.nix;
    autocmds = import ./autocmd.nix lib;

    autopairs.nvim-autopairs.enable = true;

    utility.smart-splits.enable = true;

    telescope = import ./telescope.nix pkgs;

    git = import ./git.nix;
    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
        mappings.open = "<C-t>";
        setupOpts.direction = "float";
      };
    };

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    ui = {
      noice.enable = true;
      fastaction.enable = true;
    };

    statusline = import ./statusline.nix theme.name;
    theme = import ./theme.nix (with theme; {
      inherit name;
      inherit style;
    });
    notify.nvim-notify.enable = true;
  };
}
