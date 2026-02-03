{
  programs.nvf.settings.vim = {
    fzf-lua = {
      enable = true;
    };
    keymaps = [
      {
        key = "<leader>ff";
        mode = "n";
        desc = "Find Files";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
                require("fzf-lua").files()
            end
          '';
      }
      {
        key = "<leader>fb";
        mode = "n";
        desc = "Find Buffers";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
                require("fzf-lua").buffers()
            end
          '';
      }
      {
        key = "<leader>fr";
        mode = "n";
        desc = "Find Resume";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
                require("fzf-lua").resume()
            end
          '';
      }
      {
        key = "<leader>fh";
        mode = "n";
        desc = "Find Help";
        lua = true;
        action =
          /*
          lua
          */
          ''

            function()
                require("fzf-lua").helptags()
            end
          '';
      }
      {
        key = "<leader>sg";
        mode = "n";
        desc = "Search Git Files";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
                require("fzf-lua").git_files()
            end
          '';
      }
      {
        key = "<leader>fg";
        mode = "n";
        lua = true;
        desc = "Live Grep";
        action =
          /*
          lua
          */
          ''
            function()
                require("fzf-lua").live_grep_native()
            end
          '';
      }
      {
        key = "<leader>sg";
        mode = "n";
        lua = true;
        desc = "Smart Live Grep";
        action =
          /*
          lua
          */
          ''
            function()
                require("fzf-lua").live_grep()
            end
          '';
      }
    ];
  };
}
