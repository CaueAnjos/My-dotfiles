{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    notes.todo-comments.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds = {
      whichKey.enable = true;
    };
    ui = {
      noice.enable = true;
    };

    extraPackages = with pkgs; [
      wl-clipboard
    ];

    options = {
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      expandtab = true;
      autoindent = false;
      ignorecase = true;
      smartcase = true;
    };

    globals = {
      have_nerd_font = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      lightbulb = {
        enable = true;
        setupOpts = {
          sign = {
            text = "";
            lens_text = "";
          };
        };
      };
    };

    autocomplete = {
      blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        mappings = {
          next = "<C-n>";
          previous = "<C-p>";
        };
      };
    };

    autocmds = [
      {
        desc = "highlight when yank";
        event = ["TextYankPost"];
        callback =
          lib.mkLuaInline
          /*
          lua
          */
          ''
            function()
              vim.hl.on_yank()
            end
          '';
      }
    ];
  };
}
