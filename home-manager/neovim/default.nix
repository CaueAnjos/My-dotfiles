{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default

    ./modules/autocomplete.nix
    ./modules/plugins
    ./modules/lsp.nix
    ./modules/diagnostics.nix
    ./modules/keymaps.nix
    ./modules/autocmd.nix
    ./modules/options.nix
    ./modules/theme.nix
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      autopairs.nvim-autopairs.enable = true;
      utility.smart-splits.enable = true;
      binds = {
        whichKey.enable = true;
      };
      ui = {
        noice.enable = true;
      };
    };
  };
}
