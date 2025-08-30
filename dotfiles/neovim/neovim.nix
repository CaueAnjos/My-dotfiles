{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      config.vim = let
        theme = {
          name = "catppuccin";
          style = "mocha";
        };
      in {
        package = pkgs.neovim-unwrapped;

        options = import ./options.nix;

        lsp = import ./lsp.nix;
        debugger = import ./debugger.nix;
        languages = import ./languages.nix;

        autocomplete.blink-cmp.enable = true;

        autopairs.nvim-autopairs.enable = true;

        utility.yazi-nvim = {
          enable = true;
          mappings.openYaziDir = "<leader>fm";
          setupOpts.open_for_directories = true;
        };

        telescope = import ./telescope.nix;

        git = import ./git.nix;
        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        ui = {
          noice.enable = true;
          ftaction.enable = true;
        };

        statusline = import ./statusline.nix theme.name;
        theme = import ./theme.nix (with theme; {
          inherit name;
          inherit style;
        });
        notify.nvim-notify.enable = true;
        tabline = import ./tabline.nix;
      };
    };
  };
}
