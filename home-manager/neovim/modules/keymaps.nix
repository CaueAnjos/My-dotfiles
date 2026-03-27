{
  programs.nvf.settings.vim.keymaps = [
    # NOTE: this is used to remove highlights after search
    {
      desc = "Clear highlights";
      key = "<Esc>";
      mode = "n";
      action = "<cmd>nohlsearch<CR>";
    }

    # Window, buffers and tabs
    {
      desc = "Close Current Window";
      key = "<leader>wq";
      mode = "n";
      action = "<cmd>q<CR>";
    }
    {
      desc = "New Window";
      key = "<leader>wn";
      mode = "n";
      action = "<cmd>vsplit<CR>";
    }
    {
      desc = "New Window Down";
      key = "<leader>wd";
      mode = "n";
      action = "<cmd>split<CR>";
    }
    {
      desc = "Delete Buffer";
      key = "<leader>bd";
      mode = "n";
      action = "<cmd>bdelete<CR>";
    }
    {
      desc = "Delete Other Buffers (Hidden)";
      key = "<leader>bo";
      mode = "n";
      lua = true;
      action =
        /*
        lua
        */
        ''
          function()
            local current_buf = vim.api.nvim_get_current_buf()
            local bufs = vim.api.nvim_list_bufs()

            for _, buf in ipairs(bufs) do
              if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
                local wins = vim.fn.win_findbuf(buf)
                if #wins == 0 then
                  vim.api.nvim_buf_delete(buf, { force = false })
                end
              end
            end
          end
        '';
    }
  ];
}
