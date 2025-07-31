return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      cs = { "csharpier" },
    },
    formatters = {
      csharpier = {
        command = "csharpier",
        args = { "format" },
      },
    },
  },
}
