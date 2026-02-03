{
  programs.nvf.settings.vim = {
    notify.nvim-notify.enable = true;
    keymaps = [
      {
        desc = "Find Notification";
        key = "<leader>fn";
        mode = "n";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
                require("noice").cmd("fzf")
            end
          '';
      }
      {
        desc = "Last Notification";
        key = "<leader>nl";
        mode = "n";
        lua = true;
        action =
          /*
          lua
          */
          ''
            function()
                require("noice").cmd("last")
            end
          '';
      }
    ];
  };
}
