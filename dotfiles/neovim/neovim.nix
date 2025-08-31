{
  pkgs,
  lib,
  ...
}: {
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
        extraPlugins = {
          "smear-cursor.nvim" = {
            package = pkgs.vimPlugins.smear-cursor-nvim;
            setup = "require('smear_cursor').setup {}";
          };
        };

        options = import ./options.nix;
        globals = import ./globals.nix;
        autocmds = import ./autocmd.nix lib;
        keymaps = [
          {
            desc = "Find Notification";
            key = "<leader>fn";
            mode = "n";
            silent = true;
            action = "<cmd>NoiceTelescope<CR>";
          }
          {
            desc = "Notification";
            key = "<leader>n";
            mode = "n";
            silent = true;
            action = "<cmd>Noice<CR>";
          }
        ];

        diagnostics = import ./diagnostics.nix lib;
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
        tabline = import ./tabline.nix;
      };
    };
  };
}
