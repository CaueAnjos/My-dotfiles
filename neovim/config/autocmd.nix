lib: [
  {
    desc = "highlight when yank";
    event = ["TextYankPost"];
    callback = lib.mkLuaInline ''
      function()
        vim.hl.on_yank()
      end
    '';
  }
]
