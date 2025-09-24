{
  vim.keymaps = [
    # Notifications
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
      desc = "Vertical Split Window";
      key = "<leader>w|";
      mode = "n";
      action = "<cmd>vsplit<CR>";
    }
    {
      desc = "Horizontal Split Window";
      key = "<leader>w-";
      mode = "n";
      action = "<cmd>split<CR>";
    }
    {
      desc = "Create New Tab";
      key = "<Tab>c";
      mode = "n";
      action = "<cmd>tabnew<CR>";
    }
    {
      desc = "Quit Tab";
      key = "<Tab>q";
      mode = "n";
      action = "<cmd>tabclose<CR>";
    }
    {
      desc = "Move To Next Tab";
      key = "<Tab>n";
      mode = "n";
      action = "<cmd>tabnext<CR>";
    }
    {
      desc = "Move To Previous Tab";
      key = "<Tab>p";
      mode = "n";
      action = "<cmd>tabprevious<CR>";
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
      # NOTE: this lua function delete all hidden buffers
      action = ''
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

    # Marks
    {
      desc = "Go To Marck";
      key = "ç";
      mode = "n";
      action = "'";
    }
  ];
}
