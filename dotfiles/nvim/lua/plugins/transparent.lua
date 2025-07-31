return {
  {
    "xiyaowong/nvim-transparent",
    enabled = true,
    lazy = true,
    opts = {
      enable = true,
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
      },
      exclude = {},
    },
    keys = {
      {
        "<leader>ut",
        "<cmd>TransparentToggle<CR>",
        desc = "Toggle Transparent",
        mode = "n",
      },
    },
  },
}
