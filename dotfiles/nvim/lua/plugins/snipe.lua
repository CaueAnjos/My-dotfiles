return {
  "leath-dub/snipe.nvim",
  enabled = true,
  keys = {
    {
      "gb",
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Open Snipe buffer menu",
    },
  },
  opts = {
    ui = { text_align = "file-first" },
  },
}
