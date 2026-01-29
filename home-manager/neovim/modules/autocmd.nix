{lib, ...}: {
  programs.nvf.settings.vim.autocmds = [
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
}
